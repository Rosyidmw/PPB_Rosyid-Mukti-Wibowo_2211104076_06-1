# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 13 Networking

### Guided
#### Networking / State Management
State management dalam Flutter adalah proses mengelola state atau status dari aplikasi, yaitu data atau informasi yang dapat berubah sepanjang siklus hidup aplikasi. State ini mencakup segala hal yang memengaruhi tampilan antarmuka pengguna (UI), seperti input pengguna, data dari API, dan status internal widget. Ketika aplikasi semakin kompleks dibuat, maka pasti akan ada saatnya dimana harus dibagikan state aplikasi ke berbagai halaman yang ada.  Flutter adalah deklaratif, sehingga Flutter membangun user interface berdasarkan state saat ini. Dengan menggunakan state management, dapat dilakukan sentralisasi semua state dari berbagai macam UI Control untuk mengendalikan aliran data lintas aplikasi. State management penting karena aplikasi Flutter sering kali terdiri dari banyak widget yang saling terkait. Dengan mengelola state dengan baik, kita dapat memastikan :  

1) Sinkronisasi UI dan data, karena selalu mencerminkan data terkini. 
2) Organisasi kode yang baik untuk mempermudah pengembangan dan pemeliharaan. 
3) Pengurangan bug, karena state yang dikelola dengan benar mengurangi kemungkinan terjadinya bug.

#### Jenis State dalam Flutter
1. Ephemeral State (State Lokal)
State ini hanya relevan untuk widget tertentu dan tidak dibagikan ke widget lain. Contohnya adalah state untuk TextField atau Checkbox. Dan kita dapat menggunakan StatefulWidget untuk mengelola ephemeral state. Pendekatannya state menaganement-nya ada dua, yakni StatefulWidget (untuk ephemeral state) dan InheritedWidget (untuk berbagai state antar widget). 
2. App State (State Global) 
State ini digunakan di berbagai widget dalam aplikasi. Contohnya adalah informasi pengguna yang masuk, data keranjang belanja, atau tema aplikasi. App state biasanya membutuhkan pendekatan state management yang lebih kompleks. Package/library pendukung Flutter memiliki berbagai framework atau package untuk state management, seperti : 
A. Provider 
Provider adalah library state management yang didukung resmi oleh tim Flutter. Provider memanfaatkan kemampuan bawaan Flutter seperti InheritedWidget, tetapi dengan cara yang lebih sederhana dan efisien. 
B. BloC/Cubit 
Bloc (Business Logic Component) adalah pendekatan state management berbasis pola stream. Bloc memisahkan business logic dari UI, sehingga cocok untuk aplikasi yang besar dan kompleks. 
C. Riverpod 
Riverpod adalah framework state management modern yang dirancang sebagai pengganti atau alternatif untuk Provider. Riverpod lebih fleksibel dan mengatasi beberapa keterbatasan Provider. 
D. GetX 
GetX adalah framework Flutter serbaguna yang menyediakan solusi lengkap untuk state management, routing, dan dependency injection. GetX dirancang untuk meminimalkan boilerplate code, meningkatkan efisiensi, dan mempermudah pengembangan aplikasi Flutter, terutama yang memerlukan reaktivitas tinggi.

#### Praktikum
Berikut ini implementasi code untuk counter_controller.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void getSnackbar() {
    Get.snackbar(
      'Ini judul snacbar',
      'Ini isi snacbar menggunakan GetX',
      duration: const Duration(seconds: 3),
    );
  }

  void getBottomSheet() {
    Get.bottomSheet(Container(
        height: 200,
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            'Ini adalah getx bottomsheet',
            style: TextStyle(color: Colors.white),
          ),
        )
      )
    );
  }
}
```

Berikut code main.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum_13/view/detail_page.dart';
import 'package:praktikum_13/view/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/detail', page: () => DetailPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
```

Berikut code pada my_home_page.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_13/view/detail_page.dart';
import 'package:praktikum_13/view_model/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Praktikum 13'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  controller.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Get.toNamed('/detail');
                    Get.to(DetailPage());
                  },
                  child: const Text(
                    'Go to Detail Page',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                )
              ],
            )),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrementCounter,
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: controller.getSnackbar,
            child: Icon(Icons.message),
          ),
          FloatingActionButton(
            onPressed: controller.getBottomSheet,
            child: Icon(Icons.confirmation_num),
          )
        ],
      ),
    );
  }
}
```
Untuk counter_controller.dart sudah berisikan semua implementasi yang ada pada modul. Berikut ini hasil output dari code di atas : <br>
![guided_home](https://github.com/user-attachments/assets/2f664109-dc6f-4450-b499-de04c7a9a38a)
![guided_increment](https://github.com/user-attachments/assets/010d74ae-a975-4a7b-b1f3-6a22204cf1a2)
![guided_box](https://github.com/user-attachments/assets/bfc35a0d-3a2f-4250-9719-9ee9a6a4f04e)
![guided_message](https://github.com/user-attachments/assets/70bedb44-d0f7-4027-97a3-afc7a061c916)
![guided_detail](https://github.com/user-attachments/assets/5512caca-122d-476e-99dc-3512ae5ab5e5)

### Unguided

#### Soal 

Buatlah Aplikasi Catatan Sederhana menggunakan GetX, dengan ketentuan sebagai berikut : 
1. Halaman utama atau Homepage untuk menampilkan daftar catatan yang telah ditambahkan. Setiap catatan terdiri dari judul dan deskripsi singkat, serta terdapat tombol untuk menghapus catatan dari daftar. 
2. Halaman kedua untuk menambah catatan baru, berisi : form untuk memasukkan judul dan deskripsi catatan, serta tombol untuk menyimpan catatan ke daftar (Homepage). 
3. Menggunakan getx controller. 
4. Menggunakan getx routing untuk navigasi halaman. 

Berikut ini code dari main.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unguided_13/add_screen.dart';
import 'package:unguided_13/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/add', page: () => AddScreen())
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
```
Berikut ini code dari home_screen.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided_13/notes_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final NotesController noteController = Get.put(NotesController());  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoteKu - Rosyid'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Obx(() {
        if (noteController.notes.isEmpty) {
          return Center(
            child: Text('Tidak ada catatan', style: TextStyle(fontSize: 20),),
          );
        }
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(note['title'] ?? ''),
                subtitle: Text(note['description'] ?? ''),
                trailing: IconButton(
                  onPressed: () => noteController.confirmDelete(context, index),
                  icon: Icon(Icons.delete, color: Colors.red,)
                ),
              ),
            );
          }
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
```

Berikut ini code dari add_screen.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided_13/notes_controller.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final NotesController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',  
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();
                if (title.isNotEmpty && description.isNotEmpty) {
                  noteController.addNote(title, description);
                  Get.back();
                } else {
                  noteController.snackBar();
                }
              },
              child: 
                Text('Simpan', style: TextStyle(color: Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey
                ),
            )
          ],
        ),
      ),
    );
  }
}
```

Berikut ini code dari notes_controller.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  var notes = <Map<String, String>>[].obs;

  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }

  void snackBar() {
    Get.snackbar(
      'Tidak dapat menyimpan', 'Judul dan deksripsi harus diisi semua',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
    );
  }

  void confirmDelete(BuildContext context, int index) {
    Get.defaultDialog(
      title: 'Konfirmasi Hapus',
      middleText: 'Apakah yakin untuk menghapus catatan ini? Setelah dihapus, catatan tidak dapat dikembalikan lagi',
      textConfirm: 'Hapus',
      textCancel: 'Batal',
      confirmTextColor: Colors.white,
      onConfirm: () {
        notes.removeAt(index);
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Catatan berhasil dihapus',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
        );
      },
      onCancel: () {
      },
    );
  }
}
```


Berikut ini hasil Running code tersebut.<br>
![unguided_home](https://github.com/user-attachments/assets/b739ff06-23c4-4d1c-9783-64e68f9f1b6b)
![unguided_note](https://github.com/user-attachments/assets/fee3d37d-d4bf-455a-a301-dd7dd49bb322)
![unguided_node_add](https://github.com/user-attachments/assets/e26efee5-f2d8-4c7a-ba95-9b24a1d58dd2)
![unguided_after_add](https://github.com/user-attachments/assets/398681da-0a34-41d0-a7ff-89f80d633853)
![unguided_cant_save](https://github.com/user-attachments/assets/a69f2060-87cd-491d-ae63-8a3e279e78dd)
![unguided_dialog](https://github.com/user-attachments/assets/3ca46b22-1097-4962-bb25-8d4961c60361)
![unguided_success_delete](https://github.com/user-attachments/assets/6ae5a4a1-47d2-4c1c-94fe-90467df18e61)

<br>
Pada Unguided kali ini, menerapkan GetX sebagai navigasi dalam berpindah halaman dan juga menggunakan GetX untuk menampilkan dialog, snackbar, remove dan juga add note.