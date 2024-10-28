# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 7 Navigasi dan Pengguna

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Navigasi Screen 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ini Screen 1'
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen())
                );
              },
              child: const Text('Next Screen'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Navigasi Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ini Screen 2'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back Screen'),
            )
          ],
        ),
      ),
    );
  }
}

```

#### Screenshoot Output
![tp-screen1](https://github.com/user-attachments/assets/dadb6486-7544-4299-93b5-f659d3507d17)
![tp-screen2](https://github.com/user-attachments/assets/8b1fcd74-b960-4fdf-a4e2-d865af92a32a)

#### Deskripsi Program
Kode tersebut berisikan code untuk melakukan aktivitas perpindahan Activity Screen. Untuk melakukan aktivitas tersebut, kita membutuhkan sebuah Button, dan Button yang saya gunakan adalah ElevatedButton. Lalu kita harus menyiapkan sebuah StatelessWidget yang nantinya digunakan untuk menampilkan Activity Screen yang kedua. Pada onPressed Button di Screen pertama, kita membutuhkan navigator push yang bertujuan untuk memindahkan Screen menuju screen yang sudah disiapkan ketika button ditekan oleh user. Lalu pada Activity Screen kedua, pada bagian onPressed di ElevatedButton, kita membutuhkan navigator.pop(context) dengan tujuan ketika user menekan tombol tersebut, maka akan diarahkan kembali menuju Activity Screen pertama. 