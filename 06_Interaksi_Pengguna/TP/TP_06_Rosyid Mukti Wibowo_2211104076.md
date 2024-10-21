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
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Ini Halaman Beranda',
    ),
    Text(
      'Ini Halaman Wisata',
    ),
    Text(
      'Ini Halaman Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan BottomNavigationBar'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped
      ),
    );
  }
}
```

#### Screenshoot Output
![tp_beranda](https://github.com/user-attachments/assets/a521f20b-1730-4adf-95e8-ded2b9d0fb14)
![tp_wisata](https://github.com/user-attachments/assets/716b98bc-2efe-49f8-bd94-6f28bfa1cb60)
![tp_profile](https://github.com/user-attachments/assets/991dd16b-3790-4557-b0e4-1e32618ed7c7)

#### Deskripsi Program
Kode tersebut akan menghasilkan output seperti gambar di atas. Kode tersebut mengimplementasikan Bottom Navigation Bar untuk melakukan perpindahan halaman pada Flutter. Pada kode tersebut terdapat 3 halaman yang terdiri dari halaman beranda, halaman wisata, dan halaman profile. Pada halaman beranda, maka tampilan yang akan terlihat adalah Text dengan tulisan Ini Halaman Beranda, selain itu halaman ini adalah halaman default ketika aplikasi pertama kali dibuka dan dapat dilihat dengan klik icon Rumah pada Bottom Navbar yang tersedia. Halaman kedua adalah halaman yang menampilkan Text Ini Halaman Wisata, agar dapat melihat halaman ini, maka kita perlu menekan icon Gedung yang ada pada Bottom Navbar. Halaman terakhir adalah halaman Profile yang akan menampilkan Text bertuliskan Ini Halaman Profile, agar dapat melihat halaman ini kita perlu menekan Icon Person yang ada pada Bottom Navbar.