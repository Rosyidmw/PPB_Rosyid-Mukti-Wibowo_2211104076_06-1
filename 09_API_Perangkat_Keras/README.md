# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 9 API Perangkat Keras

### Guided
#### Camera API
Camera API berfungsi untuk memungkinkan developer (pengembang) untuk mengakses dan mengontrol kamera perangkat. Flutter menyediakan paket camera yang memudahkan implementasi fitur kamera untuk mengambil foto, merekam video, dan mengakses umpan kamera secara langsung. Paket ini sangat berguna untuk membuat aplikasi yang membutuhkan pengambilan gambar atau video, seperti aplikasi media sosial atau e-commerce. Cara emnggunakan Camera API dengan menambahkan sebuah packages Camera agar aplikasi dapat mengakses kamera pada device. Cara instalasi :
1) Tambahkan package camera berikut ini pada pubspec.yaml
```
camera: ^0.11.0+2
```
2) Tambahkan perizinan akses kamera pada file AndroidManifest.xml
```
<uses-permission android:name="android.permission.CAMERA" /> 
<uses-feature android:name="android.hardware.camera" /> 
```
3) Implementasikan pada code flutter
- main.dart
```
import 'package:flutter/material.dart';
// import 'package:praktikum_09/myapi_page.dart';
import 'package:praktikum_09/myimage_gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: ImageFromGalleryEx(ImageSourceType.camera),
      //MyApiPage(),
    );
  }
}
```
- myapi_page.dart
```
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyApiPage extends StatefulWidget {
  const MyApiPage({super.key});

  @override
  State<MyApiPage> createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPage> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);

    _initializeControllerFuture = _controller.initialize();
    // setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Example'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),
      body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                          imagePath: image.path,
                        )));
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Picture'),
      ),
      body: Image.file(File(imagePath)),
    );
  }
}
```
- Hasil output dari code tersebut<br>
![myapi_page](https://github.com/user-attachments/assets/05e1ee7a-abf2-4251-bfa9-826729fe958a)
![display_picture](https://github.com/user-attachments/assets/89ec4dbd-a418-46bc-912b-93b5839ef19b)


#### Media API
Media API adalah sekumpulan alat dan pustaka yang mendukung pengelolaan dan interaksi dengan berbagai jenis media, seperti gambar, video, dan audio. Flutter tidak memiliki API media bawaan untuk semua kebutuhan media, tetapi dapat menggunakan paket-paket tambahan untuk mengakses fitur media yang umum di aplikasi.  Pada bahasan kali ini, kita akan menggunakan packages atau plugin Image Picker supaya aplikasi dapat mengakses media galeri pada device.
- Code myimage_gallery_page.dart
```
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFromGalleryEx extends StatefulWidget {
  final ImageSourceType type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  File? _image;
  late ImagePicker imagePicker;
  final ImageSourceType type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type == ImageSourceType.camera
            ? "Image from Camera"
            : "Image from Gallery"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 52),
          Center(
            //mengambil gambar dari camera atau gallery
            child: GestureDetector(
              onTap: () async {
                //operasi ternary untuk memilih sumber gambar
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;

                //menyimpan gambar pada variabel image
                XFile? image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);

                if (image != null) {
                  setState(() {
                    _image = File(image.path);
                  });
                }
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                ),

                // menampilkan gambar dari camera atau gallery
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )

                    // jika tidak ada gambar yang dipilih
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                        ),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ImageSourceType { camera, gallery }
```
- Output dari code tersebut<br>
![myimage_gallery_page](https://github.com/user-attachments/assets/0039ac39-7077-4ebf-af6c-c79b6d5aada0)
![image_gallery_from_camera](https://github.com/user-attachments/assets/ef386268-4622-49ab-9545-74c7a0bebd72)


### Unguided

#### Soal 

Memodifikasi tugas TP 09 agar semua fungsi dapat digunakan dengan baik. Berikut ini adalah semua code yang digunakan agar semua fungsi dapat bekerja dengan baik. Termasuk menambahkan permission pada AndroidManifest.xml dan juga menambahkan beberapa packages yang dibutuhkan.
1) main.dart
```
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tp_09/my_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}
```
2) my_main.dart
```
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Memilih Gambar'),
        backgroundColor: Colors.orangeAccent.shade100,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            DottedBorder(
              color: Colors.grey,
              strokeWidth: 1,
              dashPattern: [5, 5],
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              child: Container(
                height: 260,
                width: 350,
                child: _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.image_outlined,
                        size: 230,
                        color: Colors.grey,
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImageFromCamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Camera',
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                      iconColor: Colors.black,
                      backgroundColor: Colors.orangeAccent.shade100),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _pickImageFromGallery,
                  icon: const Icon(Icons.photo),
                  label: const Text(
                    'Galery',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.black,
                    backgroundColor: Colors.orangeAccent.shade100,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: _clearImage,
                child: const Text(
                  'Hapus Gambar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.orangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```
Pada Unguided kali ini saya hanya melanjutkan project TP 09 sehingga semua fungsi bekerja dengan baik. Mulai dari button camera jika diklik maka akan diarahkan ke kamera. Lalu ada button galery jika diklik akan mengarahkan ke file manager untuk memilih foto. Tidak hanya itu, ada juga container yang menampung gambar yang sudah di pilih atau gambar yang sudah difoto dan ada button Hapus Gambar yang berfungsi untuk menghapus gambar yang sudah dipilih sebelumnya.

Berikut ini hasil Running code tersebut<br>
![unguided_main_dart](https://github.com/user-attachments/assets/12a5e632-58a8-4b88-a797-e75c691a092c)
![unguided_camera](https://github.com/user-attachments/assets/73b19be6-db8d-4646-af75-6f88deb1e864)
![unguided_camera_oke](https://github.com/user-attachments/assets/e2093ff1-4f34-4919-9477-ed6b63ec0dde)
![unguided_image_from_camera](https://github.com/user-attachments/assets/fc8262e6-9e3a-41af-8e0f-77f565eeae64)
![unguided_file_manager](https://github.com/user-attachments/assets/339eff9b-71a6-476b-977c-5d4bcb3b04d5)
![unguided_image_from_file_manager](https://github.com/user-attachments/assets/acf5fee8-20c9-45db-af2f-3195e8c7382e)