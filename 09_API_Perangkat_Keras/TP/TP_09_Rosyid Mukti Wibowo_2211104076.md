# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 9 API Perangkat Keras

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

#### Source Code
```
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
                  child: const Icon(
                    Icons.image_outlined,
                    size: 230,
                    color: Colors.grey,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Camera',
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                      iconColor: Colors.black,
                      backgroundColor: Colors.orangeAccent.shade100),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {},
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
                onPressed: () {},
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

#### Screenshoot Output
![tp_09](https://github.com/user-attachments/assets/783c801c-477d-4a2e-854b-151b2341e91f)

#### Deskripsi Program
Program pada tugas TP_09 ini menampilkan sebuah aplikasi yang memiliki fungsi untuk memilih, yang dapat dilakukan menggunakan tombol Camera dan juga tombol Galeri. Selain itu, terdapat sebuah tombol yang bertuliskan 'Hapus Gambar', yang akan berfungsi untuk menghapus gambar yang sudah dipilih. Tidak hanya itu, terdapat sebuah container yang berupa sebuah gambar Icon yang dikelilingi oleh DottedBorder, yang akan menampilkan gambar nantinya. Untuk DottedBorder sendiri bisa digunakan setelah kita mengimportkan sebuah dependency bernama dotted_border sebagai border yang memiliki bentuk strip. Namun, pada TP 09 kali ini, semua tombol dan juga icon tidak ada yang berfungsi sebagaimana mestinya. Untuk sekarang berfokuskan pada tampilannya saja agar sesuai dengan tugas.
