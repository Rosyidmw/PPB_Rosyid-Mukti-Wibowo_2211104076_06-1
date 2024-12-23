# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 14 Data Storage 3

### Guided
#### APA itu REST API
REST API (Representational State Transfer Application Programming Interface) adalah antarmuka yang memungkinkan aplikasi klien untuk berinteraksi dengan database melalui protokol HTTP. REST API menyediakan cara untuk membaca, menambahkan, memperbarui, dan menghapus data dari database tanpa harus mengakses database langsung.Mendapatkan token unik dari setiap perangkat pengguna. Kegunaan REST API : 
1. Interoperabilitas: REST API memungkinkan aplikasi berbasis web dan mobile untuk 
mengakses data yang sama. 
2. Efisiensi: Data yang dikirimkan biasanya ringan (format JSON atau XML), membuatnya cepat 
untuk dikirim dan diterima. 
3. Keamanan: API bisa membatasi akses menggunakan token autentikasi. 

#### Apa itu HTTP
HTTP (Hypertext Transfer Protocol) adalah protokol komunikasi utama yang digunakan untuk mengirimkan data antara klien (misalnya browser atau aplikasi) dan server. <br>
Metode HTTP Utama : 
1. GET: Mengambil data dari server. 
2. POST: Mengirim data baru ke server. 
3. PUT/PATCH: Memperbarui data yang ada di server. 
4. DELETE: Menghapus data dari server. 
Komponen HTTP Request 
1. URL: Alamat yang menunjukkan resource tertentu. 
2. Method: Operasi yang akan dilakukan (GET, POST, dll.). 
3. Headers: Informasi tambahan seperti format data atau token autentikasi. 
4. Body: Data yang dikirimkan (digunakan dalam POST/PUT). 
Komponen HTTP Response 
1. Status Code: Menunjukkan hasil operasi (misalnya, 200 untuk berhasil, 404 untuk resource tidak ditemukan). 
2. Headers: Informasi tambahan dari server. 
3. Body: Data yang dikembalikan server (biasanya dalam format JSON).

#### Praktikum
Berikut ini implementasi code untuk api_service.dart
```
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';
  List<dynamic> posts = [];

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      posts = json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      posts.add({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'id': posts.length + 1,
      });
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/1'),
      body: json.encode({
        'title': 'Updated Title',
        'body': 'Updated Body',
        'userId': 1,
      }),
    );

    if (response.statusCode == 200) {
      final updatedPost = posts.firstWhere((post) => post['id'] == 1);
      updatedPost['title'] = 'Updated Title';
      updatedPost['body'] = 'Updated Body';
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/1'),
    );

    if (response.statusCode == 200) {
      posts.removeWhere((post) => post['id'] == 1);
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
```

Berikut code main.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum_14/screens/home_screen.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: HomeScreen(),
    );
  }
}
```

Berikut code pada home_screen.dart
```
import 'package:flutter/material.dart';
import 'package:praktikum_14/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _posts = []; // Menyimpan list posts
  bool _isLoading = false; // Untuk indikator loading
  final ApiService _apiService = ApiService(); // Instance ApiService

  // Fungsi untuk menampilkan SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Fungsi untuk memanggil API dan menangani operasi
  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await operation; // Menjalankan operasi API
      setState(() {
        _posts = _apiService.posts;
      });
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 14'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _posts.isEmpty
                    ? const Text(
                        "Tekan tombol GET untuk mengambil data",
                        style: TextStyle(fontSize: 12),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _posts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Text(
                                    _posts[index]['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  subtitle: Text(
                                    _posts[index]['body'],
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.fetchPosts(), 'Data berhasil diambil!'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text(
                    'GET',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.createPost(), 'Data berhasil ditambahkan!'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.updatePost(), 'Data berhasil diperbarui!'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.deletePost(), 'Data berhasil dihapus!'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
```
Untuk semua file sudah berisikan semua implementasi yang ada pada modul. Berikut ini hasil output dari code di atas : <br>
![guided_home](https://github.com/user-attachments/assets/d70e2618-6bae-431a-92e2-afc71a336672)
![guided_get](https://github.com/user-attachments/assets/a02391a9-fa95-4a58-a1c7-07f477c7a11e)
![guided_post](https://github.com/user-attachments/assets/7e1c7f19-b8b3-4011-9380-47355902ea6f)
![guided_update](https://github.com/user-attachments/assets/583886e1-33c9-4f4b-8b69-1267d5ea0d5c)
![guided_delete](https://github.com/user-attachments/assets/83e1daaa-43ab-44e7-a091-2ece3203a6ca)

### Unguided

#### Soal 

Modifikasi tampilan Guided dari praktikum di atas: 
1. Gunakan State Management dengan GetX: 
- Atur data menggunakan state management GetX agar lebih mudah dikelola. 
- Implementasi GetX meliputi pembuatan controller untuk mengelola data dan penggunaan widget Obx untuk menampilkan data secara otomatis setiap kali ada perubahan. 
2. Tambahkan Snackbar untuk Memberikan Respon Berhasil: 
- Tampilkan snackbar setelah setiap operasi berhasil, seperti menambah atau memperbarui data. 
- Gunakan Get.snackbar agar pesan sukses muncul di layar dan mudah dipahami oleh pengguna.
Berikut ini code dari main.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:praktikum_14/screens/home_screen.dart';
import 'package:praktikum_14/screens/homegetx_screen.dart';

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
        GetPage(name: '/', page: () => HomeScreenGetX(),)
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      // home: HomeScreenGetX(),
    );
  }
}
```
Berikut ini code dari homegetx_screen.dart
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_14/view_model/api_controller.dart';

class HomeScreenGetX extends StatelessWidget {
  HomeScreenGetX({super.key});

  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unguided 14 GetX'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.posts.isEmpty) {
                return const Text(
                  "Tekan tombol GET untuk mengambil data",
                  style: TextStyle(fontSize: 12),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            controller.posts[index]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          subtitle: Text(
                            controller.posts[index]['body'],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text(
                    'GET',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.createPost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('POST', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.updatePost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('UPDATE', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.deletePost,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('DELETE', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

Berikut ini code dari api_controller.dart
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  var posts = <dynamic>[].obs; 
  var isLoading = false.obs; 

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body);
        _showSnackbar('Success', 'Data berhasil diambil!', Colors.green);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });
        _showSnackbar('Success', 'Data berhasil ditambahkan!', Colors.green);
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePost() async {
    isLoading.value = true;
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );

      if (response.statusCode == 200) {
        final index = posts.indexWhere((post) => post['id'] == 1);
        if (index != -1) {
          posts[index] = {
            'id': 1,
            'title': 'Updated Title',
            'body': 'Updated Body',
            'userId': 1,
          };
          _showSnackbar('Success', 'Data berhasil diperbarui!', Colors.green);
        }
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      _showSnackbar('Error', e.toString(), Colors.red);
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> deletePost() async {
  isLoading.value = true;
  try {
    final response = await http.delete(Uri.parse('$baseUrl/posts/1'));

    if (response.statusCode == 200) {
      posts.removeWhere((post) => post['id'] == 1);
      _showSnackbar('Success', 'Data berhasil dihapus!', Colors.green);
    } else {
      throw Exception('Failed to delete post');
    }
  } catch (e) {
    _showSnackbar('Error', e.toString(), Colors.red);
  } finally {
    isLoading.value = false;
  }
}

  void _showSnackbar(String title, String message, Color backgroundColor) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    borderRadius: 8,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    icon: Icon(
      title == 'Success' ? Icons.check_circle : Icons.error,
      color: Colors.white,
    ),
  );
}

}
```

Berikut ini hasil Running code tersebut.<br>
![unguided_home](https://github.com/user-attachments/assets/96cace46-dc01-4c17-8afd-ca4a3be940a8)
![unguided_get](https://github.com/user-attachments/assets/0dd9ee20-384e-4847-b714-dc3d7742f138)
![unguided_success](https://github.com/user-attachments/assets/81e89ed6-ca9c-4c3c-9f8a-fdda83f16e51)
![unguided_post](https://github.com/user-attachments/assets/0157c902-9c7a-48e5-86fa-fbe82d589402)
![unguided_post2](https://github.com/user-attachments/assets/2e8507f0-1a2b-4581-84d7-c9106d38c56d)
![unguided_update](https://github.com/user-attachments/assets/ac9423ee-8a1d-428a-9c59-d3a9558a5b35)
![unguided_delete](https://github.com/user-attachments/assets/4fc0960c-0a3a-4535-89ec-02b3e565f5fa)

<br>
Pada Unguided kali ini, ditugaskan untuk memodifikasi dari guided yang sudah dibuat dengan menggunakan GetX. Untuk kode tersebut sudah menerapkan GetX untuk seluruh proses, termasuk menampilkan seluruh Snacbar pada setiap proses yang terjadi ketika aplikasi dijalankan.