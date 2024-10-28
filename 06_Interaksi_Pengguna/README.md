# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 6 Interaksi Pengguna

### Guided
#### Packages
Secara singkat, dart package terdapat pada direktori yang didalamnya terdapat file pubspec.yaml. Contoh penggunaan packages adalah membuat request ke server menggunakan protokol http. Custom navigation/route handling menggunakan fluro, dsb. Langkah menggunakan packages
- Akses website pub.dev berikut : [pub.dev](https://pub.dev/)
![pub-dev](https://github.com/user-attachments/assets/fa81703f-5533-4b30-a95b-b2ee5ce947e3)
- Cari package yang akan digunakan, lalu salin judul dari package yang akan digunakan
- Langkah selanjutnya adalah membuka file pubspec.yaml, dan pastekan yang sudah di copy tadi seperti gambar di bawah ini. Lalu save file tersebut
![add-dependencies](https://github.com/user-attachments/assets/05ea476d-71aa-4405-897a-74795de15002)

#### User Interaction

1) Stateful & Stateless
Widget stateless tidak pernah berubah. Ikon, IconButton, dan Teks adalah contoh widget stateless. Sub kelas widget stateless StatelessWidget. Widget stateful bersifat dinamis misalnya, ia dapat mengubah tampilannya sebagai respons terhadap peristiwa yang dipicu oleh interaksi pengguna atau saat menerima data. Kotak centang, Radio, Slider, InkWell, Form, dan TextField adalah contoh widget stateful. Subkelas widget stateful StatefulWidget.

2) Form
Form adalah kumpulan widget yang digunakan untuk mengumpulkan input dari pengguna. Biasanya, form ini terdiri dari beberapa field seperti TextFormField, Checkbox, Radio, dan lain-lain. Anda dapat menggunakan Form widget untuk mengelompokkan dan mengelola status dari semua field dalam form. 
```
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatelessWidget {
  const MyPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Package',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextField(
              obscureText: false,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Masukkan Username",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 18,
            ),
            const TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Masukkan Password",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
```
Berikut adalah output penggunaan Form <br>
![book](https://github.com/user-attachments/assets/efe6cba1-6777-4eac-a2ee-590654319cf3)

3) Menu
Salah satu hal penting dari pembuatan aplikasi adalah menu. Menu ini berfungsi untuk separasi antar fitur atau page. Sulit rasanya apabila semua fitur ditampilkan dalam satu halaman, selain sulit, pengguna akan kesulitan dalam mengoperasikannya. Maka disini menu page sangat bermanfaat. Secara umum terdapat 2 jenis widget menu yang sering digunakan, yaitu `bottom navigation bar` dan `tab bar`. Karena Flutter mendukung penuh guideline yang dibuat oleh Google, yaitu Material Design.

- Tab Bar
Membuat TabController. Agar tab berfungsi, Anda harus tetap menyinkronkan tab yang dipilih dan bagian konten. Menggunakan DefaultTabController adalah opsi paling sederhana, karena ia membuat TabController dan membuatnya tersedia untuk semua widget turunan. Dan pada saat tab dipilih, maka harus menampilkan sebuah konten. Anda dapat membuat tabs menggunakan TabBar widget. Contoh dibawah adalah membuat TabBar dengan tiga widget Tab yang disimpan dalam widget AppBar. 
```
import 'package:flutter/material.dart';

class MyTabBarState extends StatefulWidget {
  const MyTabBarState({super.key});

  @override
  State<MyTabBarState> createState() => _MyTabBarStateState();
}

class _MyTabBarStateState extends State<MyTabBarState> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Tab Bar'),
          backgroundColor: Colors.amber,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                text: 'Menu',
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
                text: 'Schedule',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'History',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Ini konten menu'),
            ),
            Center(
              child: Text('Ini konten schedule'),
            ),
            Center(
              child: Text('Ini konten history'),
            ),
          ],
        ),
      ),
    );
  }
}
```
Berikut adalah output dari Tab Bar <br>
![home-history](https://github.com/user-attachments/assets/06d94dbd-0edc-410e-a682-5443aa5d6632)
![home-menu](https://github.com/user-attachments/assets/7d7852db-a45d-4601-8168-f9f7396cd916)
![home-schedule](https://github.com/user-attachments/assets/53693b9e-f299-473e-9ee2-338b8cc164fb)

- Bottom Navigation Bar
```
import 'package:flutter/material.dart';
import 'package:praktikum_6/my_tabbar.dart';
import 'package:praktikum_6/package.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  static List<Widget> _page = <Widget> [
    const MyTabBarState(),
    const MyPackage(),
    const MyPackage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Buttom NavBar'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amberAccent,
        onTap: _onItemTapped,
      )
    );
  }
}
```
Berikut adalah output dari Bottom Navigation Bar <br>
![profile](https://github.com/user-attachments/assets/914302f4-7d4c-43c7-8610-189088468815)

4) Buttons
- ElevatedButton
ElevatedButton adalah tombol yang biasa kita gunakan saat kita mendaftar, submit, login, dst. Widget ini digunakan untuk membuat tombol dengan tampilan yang lebih menonjol, biasanya dengan efek bayangan yang memberikan kesan kedalaman. Tombol ini ideal untuk aksi yang lebih penting atau membutuhkan perhatian lebih dari pengguna. 

- TextButton
TextButton adalah widget yang digunakan untuk membuat tombol yang menampilkan teks. Tombol ini memiliki tampilan yang sederhana dan biasanya digunakan untuk tindakan yang tidak terlalu mencolok.

- DropdownButton
DropdownButton adalah widget yang memungkinkan pengguna untuk memilih satu nilai dari serangkaian pilihan yang disediakan dalam bentuk menu dropdown. Ini sangat berguna untuk situasi di mana Anda ingin membatasi pilihan pengguna ke beberapa opsi yang sudah ditentukan.


### Unguided

#### Modifikasi Project TP 06 

TP 06 setelah dimodifikasi dengan mengimplementasikan penggunaan form dan button
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
  static final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue,
                )),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Masukkan Nama"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue,
                )),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Masukkan Email"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fixedSize: const Size(100, 50),
            ), 
            child: const Text('Submit', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    ),
    const Text(
      'Ini Halaman Wisata',
    ),
    const Text(
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
        title: const Text('Beranda'),
        backgroundColor: Colors.orange,
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
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped),
    );
  }
}

```
Berikut ini hasil Running code tersebut<br>
![unguided](https://github.com/user-attachments/assets/211066dc-6239-487f-9ec9-70a9cea7ff2e)

Program tersebut hanya melanjutkan dari TP 06. Namun, di dalamnya mengimplementasikan penggunaan form dan button. Form terdiri dari 2 form yaitu untuk menginputkan Nama dan juga Email. Tidak hanya itu, pada Unguided kali ini juga menggunakan button khususnya ElevatedButton yang saya gunakan agar tampilannya mirip dengan perintah tugas.