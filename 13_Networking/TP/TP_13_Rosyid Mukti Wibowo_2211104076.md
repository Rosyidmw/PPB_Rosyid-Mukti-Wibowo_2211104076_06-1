# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 13 Networking

Disusun Oleh : <br>
Nama : Rosyid Mukti Wibowo <br>
NIM : 2211104076 <br>
Kelas : SE-06-01 <br>
<br>
Asisten Praktikum : <br>
Muhammad Faza Zulian Gesit Al Barru <br>
Aisyah Hasna Aulia <br>
Dosen Pengampu : Yudha Islami Sulistya, S.Kom., M.Cs.

#### Program Studi S1 Software Engineering
#### Fakultas Informatika
#### Telkom University Purwokerto
#### 2024


### Tugas Pendahuluan

#### SOAL NOMOR 1
Apa yang dimaksud dengan state management pada Flutter? 
Jawab : State management adalah konsep untuk mengelola dan mempertahankan state (keadaan) suatu aplikasi selama aplikasi berjalan. State merujuk pada data atau informasi yang digunakan oleh aplikasi untuk menentukan apa yang akan ditampilkan di UI. Dalam Flutter, state management digunakan untuk memastikan sinkronisasi antara tampilan (UI) dan data. Flutter memiliki beberapa metode untuk mengelola state, seperti:
1. StatefulWidget
2. Provider
3. Riverpod
4. Bloc (Business Logic Component)
5. GetX (salah satu yang populer karena kesederhanaan dan performanya).

#### SOAL NOMOR 2
Sebut dan jelaskan komponen-komponen yang ada di dalam GetX. 
Jawab : GetX memiliki tigas komponen utama :<br>
1. State Management : Mengelola perubahan state aplikasi dengan pendekatan reaktif.
- Obx: Widget yang secara otomatis memperbarui UI saat nilai variabel Rx berubah.
- GetxController: Tempat untuk mendefinisikan logika bisnis dan state aplikasi.
2. Route Management: Navigasi antar halaman tanpa kebutuhan untuk membangun context. Contoh: Get.to(PageName()), Get.off(PageName()).
3. Dependency Injection: Mengelola dependensi dengan efisien.
- Get.put() digunakan untuk membuat dan menginisialisasi dependensi.
- Get.lazyPut() untuk inisialisasi lazy-loading.


#### SOAL NOMOR 3
Lengkapilah code di bawah ini, dan tampilkan hasil outputnya serta jelaskan.<br>
Jawab : Berikut ini code lengkapnya
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // Variabel untuk menyimpan nilai counter (reaktif)
  var counter = 0.obs;

  // Fungsi untuk menambah nilai counter
  void increment() {
    counter++;
  }

  // Fungsi untuk mereset nilai counter
  void reset() {
    counter.value = 0;
  }
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(() {
          
          return Text(
            "${controller.counter}", 
            style: TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Menambah nilai counter
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Mereset nilai counter
              controller.reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
```

Berikut ini output dari code tersebut: <br>
![tp_13_main](https://github.com/user-attachments/assets/87f59d93-f5c1-4dcc-93bb-cdeeb88c29e7)
![tp_13_add](https://github.com/user-attachments/assets/951fa582-e555-4559-bd90-f1180cf03d9c)

Program tersebut adalah sebuah aplikasi sederhana untuk menambahkan angka dan mereset angka. Biasanya ketika membuat aplikasi seperti itu, kita harus menggunakan StatefulWidget. Namun, untuk sekarang membuat aplikasi seperti itu dengan menggunakan StatelessWidget dibantu dengan GetX sebagai state management. Ketika user menekan button add, maka angka yang ada di tengah akan bertambah 1, jika menekan tombol reset maka akan membuat angka tersebut kembali menjadi 0. Algoritma program bekerja dengan memanfaatkan konsep reaktif dari GetX, di mana nilai variabel counter didefinisikan sebagai variabel reaktif (obs) yang secara otomatis memicu pembaruan UI setiap kali nilainya berubah. Logika utama dikelola dalam kelas CounterController, yang menyediakan fungsi untuk menambah dan mereset nilai counter.