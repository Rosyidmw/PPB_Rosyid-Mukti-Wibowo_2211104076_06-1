# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 4 Antar Muka Pengguna

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
``
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
        home: Scaffold(
            appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 99, 7, 185),
            title: const Text(
                'Rekomendasi Wisata',
                style: TextStyle(color : Colors.white)),
            centerTitle: true,
            ),
            body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                    'Baturraden',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    ), 
                    ),
                    Image.network(
                    'https://asset.kompas.com/crops/k0ZCdb36lRDp6ozoltP7q3yugHM=/9x0:1123x743/750x500/data/photo/2023/10/22/6534d9b120efd.png',
                    width: 300,
                    ),
                    const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                        'Baturaden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet, sekitar 15 kilometer dari pusat kota Purwokerto, Kabupaten Banyumas, Jawa Tengah. Terkenal dengan pemandangan alamnya yang indah dan udara yang sejuk, Baturaden menjadi destinasi favorit wisatawan lokal maupun mancanegara.',
                        textAlign: TextAlign.center,
                        ),
                    ),
                    ElevatedButton(onPressed: () {

                    },
                    child: Text('Kunjungi Sekarang')
                    )
                ],
            ),
            ),
        ),
        );
    }
    }
``

#### Screenshoot Output
![tp_output](https://github.com/user-attachments/assets/df0e155b-8a98-4c38-bbee-3d17882224c1)

#### Deskripsi Program
Kode tersebut akan menghasilkan output seperti gambar di atas. Kode tersebut tersusun dari AppBar, Column, Padding, Image Network, dan Elevated Button. AppBar berisikan background color untuk bagian appbar dan juga text yang ada di appbar serta menggunakan text color white yang posisinya ada di center appbar. Untuk lainnya berada bada body yang berisikan informasi terkait tentang nama Baturraden, gambar wisata di Baturraden yang diperoleh dari internet. Lalu berikutnya ada bagian deskripsi dari Baturraden yang terbungkus oleh child text dengan textAlign berada pada center serta memiliki padding disemua sisi sebesar 24. Pada bagian bawah terdapat elevated button yang memiliki tulisan 'kunjungi sekarang', namun sekarang button belum memiliki aksi apapun karena belum ada proses yang terjadi pada bagian onPressed.