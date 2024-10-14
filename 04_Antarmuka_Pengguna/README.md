# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 4 Antarmuka Pengguna

### Guided
#### Pengenalan Widget
Pada dasarnya semua tampilan di dalam Flutter adalah komponen yang bernama Widget, dan akan dipecah menjadi komponen-komponen yang kecil serta memiliki environment sendiri untuk mengelola dirinya. Masing-masing widget memiliki state dan konfigurasinya sendiri, sehingga ketika state pada widget berubah, widget akan membuat ulang dirinya agar selalu update dengan perubahan yang terjadi. Jenis-jenis Layout pada Flutter :
1) Container Adalah widget dasar yang digunakan untuk menentukan batasan atau constraints dari child widget-nya. Container dapat diisi dengan berbagai jenis child widget seperti : text, image, atau bahkan layout widget lainnya. 
2) Row dan Column Adalah layout widget yang digunakan untuk mengatur child widget secara horizontal atau vertical. 
3) Stack Adalah layout widget yang digunakan untuk menumpuk beberapa widget di atau satu sama lain. 
4) Expanded dan Flexible Adalah widget yang digunakan untuk mengatur bagaimana child widget mengisi ruang yang tersedia. Expanded akan memberikan semua ruang yang tersedia ke child widget, sedangkan Flexible akan memberikan sejumlah ruang yang dapat berubahubah sesuai dengan kondisi yang ada. 
5) ListView Adalah widget yang digunakan untuk menampilkan daftar item yang dapat di-scroll. 
6) GridView Adalah widget yang digunakan untuk menampilkan daftar item dalam bentuk grid. 
7) Wrap Adalah widget yang digunakan untuk menampilkan child widget dalam baris atau kolom. Jika child widget melebihi lebar atau tinggi dari wrap, maka widget tersebut akan dibungkus ke baris atau kolom berikutnya. 
8) Table Adalah widget yang digunakan untuk menampilkan data dalam bentuk tabel. TableRow untuk menambahkan baris, dan TableCell untuk menambahkan kolom.

#### Grid View
GridView merupakan widget yang serupa dengan Array 2D dalam bahasa pemrograman apapun. Widget tersebut digunakan ketika harus menampilkan sesuatu pada Grid tersebut, seperti menampilkan images, text, icons, dll. Berikut code dan contoh penerapan GridView:
```
  GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("He'd have you all unravel at the"), 
            color: Colors.teal[100], 
          ),
           Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Heed not the rabble'), 
            color: Colors.teal[200], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Sound of screams but the'), 
            color: Colors.teal[300], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Who scream'), 
            color: Colors.teal[400], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Revolution is coming...'), 
            color: Colors.teal[500], 
          ), 
          Container( 
            padding: const EdgeInsets.all(8), 
            child: const Text('Revolution, they...'), 
            color: Colors.teal[600], 
          ),
        ],
      ),
```
![grid_view](https://github.com/user-attachments/assets/0684e337-8190-42dd-a2ba-3db71c6d6f24)

#### ListView
ListView merupakan widget scroll yang paling umum digunakan. Widget ini dapat menampilkan lebih dari satu komponen atau widget melalui variabel children. Pada pembahasan kali ini akan menggunakan ListView default dengan variabel children pada widget tersebut List Widget. Cara penggunaan ListView ini dengan memasukkan widget yang ingin disusun sebagai children dari ListView. Berikut code dan contoh penerapan ListView :
```
import 'package:flutter/material.dart';

class LatihanListView extends StatelessWidget {
  const LatihanListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listContainer = [
          Container(
            height: 300,
            color: Colors.amber,
            child: const Center(child: Text('Type A'),),
            margin: EdgeInsets.all(10),
          ),
          Container( 
            height: 350, 
            color: Colors.blue, 
            child: const Center(child: Text('Type B'))
          ), 
          Container( 
            height: 250, 
            color: Colors.amber[100], 
            child: const Center(child: Text('Type C')), 
          ),
          Container(
            height: 230,
            color: Colors.amber,
            child: const Center(child: Text('Type D'),),
          ),
          Container( 
            height: 190, 
            color: Colors.cyan, 
            child: const Center(child: Text('Type E'))
          ), 
          Container( 
            height: 120, 
            color: Colors.amber[100], 
            child: const Center(child: Text('Type F')), 
          ),
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan List View"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: listContainer.length,
        itemBuilder: (context, index) {
          return listContainer[index];
        },
      )
    );
  }
}
```
![list_view](https://github.com/user-attachments/assets/b9608324-392e-4dc0-987d-1b67ad736009)

### Unguided

#### Modifikasi TP 04 

TP 04 setelah dimodifikasi menggunakan ListView codenya menjadi seperti ini
```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Map<String, String>> wisata = const [
    {
      'nama': 'Baturraden',
      'gambar': 'https://asset.kompas.com/crops/k0ZCdb36lRDp6ozoltP7q3yugHM=/9x0:1123x743/750x500/data/photo/2023/10/22/6534d9b120efd.png',
      'deskripsi':
          'Baturaden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet, sekitar 15 kilometer dari pusat kota Purwokerto, Kabupaten Banyumas, Jawa Tengah. Terkenal dengan pemandangan alamnya yang indah dan udara yang sejuk, Baturaden menjadi destinasi favorit wisatawan lokal maupun mancanegara',
    },
    {
      'nama': 'Curug Cipendok',
      'gambar': 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Curug_Cipendok_Waterfall.jpg',
      'deskripsi':
          'Air terjun dengan ketinggian sekitar 92 meter, dikelilingi oleh hutan lebat yang asri.',
    },
    {
      'nama': 'Telaga Sunyi',
      'gambar': 'https://visitjawatengah.jatengprov.go.id/assets/images/730c64c2-1e01-41d2-8e4a-36e813e98252.jpg',
      'deskripsi':
          'Telaga alami dengan air jernih dan suasana tenang, cocok untuk bersantai dan berenang.',
    },
    {
      'nama': 'Small World (Taman Miniatur Dunia)',
      'gambar': 'https://img2.beritasatu.com/cache/investor/480x310-3/1631431145.jpg',
      'deskripsi':
          'Taman dengan miniatur bangunan terkenal dunia, cocok untuk rekreasi keluarga dan edukasi.',
    },
    {
      'nama': 'Kebun Raya Baturraden',
      'gambar': 'https://radarbanyumas.disway.id/upload/001fb9da7faf81224befbaf4a554b08a.jpg',
      'deskripsi':
          'Taman botani yang menyajikan berbagai flora, terletak di kawasan Baturraden.',
    },
    {
      'nama': 'Pancuran Pitu',
      'gambar': 'https://visitjawatengah.jatengprov.go.id/assets/images/2c0f058c-81ee-4e33-92f8-b914086ea31e.jpg',
      'deskripsi':
          'Pemandian air panas alami dengan tujuh pancuran, dipercaya memiliki khasiat untuk kesehatan.',
    },
    {
      'nama': 'Museum Wayang Banyumas',
      'gambar': 'https://img.inews.co.id/media/1200/files/inews_new/2022/08/03/museum_wayang_di_banyumas.jpg',
      'deskripsi':
          'Museum yang menyimpan berbagai koleksi wayang dan artefak budaya Banyumas.',
    },
    {
      'nama': 'Alun-Alun Purwokerto',
      'gambar': 'https://suarabanyumas.com/wp-content/uploads/2021/11/Alun-alun.jpg',
      'deskripsi':
          'Ruang publik di pusat kota Purwokerto, sering digunakan untuk kegiatan masyarakat.',
    },
    {
      'nama': 'Curug Jenggala',
      'gambar': 'https://upload.wikimedia.org/wikipedia/commons/5/54/Curug_Jenggala%2C_Kalipagu.jpg',
      'deskripsi':
          'Air terjun indah dengan tiga aliran utama, populer untuk spot foto dan wisata alam.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Wisata di Banyumas', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 99, 7, 185),
        ),
        body: ListView.builder(
          itemCount: wisata.length,
          itemBuilder: (context, index) {
            final tempat = wisata[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      tempat['gambar']!,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tempat['nama']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tempat['deskripsi']!,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

```
Berikut ini hasil Running code tersebut pada Android Virtual Device
![unguided1](https://github.com/user-attachments/assets/61555a03-0eb1-411a-81d4-21403a8090a2)
![unguided2](https://github.com/user-attachments/assets/e59b08b2-c99b-4f08-9208-c4226c0a1ec8)

Program tersebut hanya melanjutkan dari TP 04. Namun, di dalamnya mengimplementasikan ListView untuk menampung beberapa data yang ditampilkan pada Android Virtual Device sehingga dapat menampilkan lebih dari 1 rekomendasi tempat wisata.