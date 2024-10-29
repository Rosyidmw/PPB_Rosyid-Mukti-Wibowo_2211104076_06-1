# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 7 Navigasi dan Notifikasi

### Guided
#### Model
Langkah pertama adala membuat terlebih dahulu file model class yang diberi nama product.dart
```
class Product {
  final int id;
  final String nama;
  final double harga;
  final String imgUrl;
  final String deskripsi;

  // Constructor, untuk menginisialisasi objek
  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.imgUrl,
    required this.deskripsi
  });

  // Method to convert json to object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'].toDouble(),
      imgUrl: json['imgUrl'],
      deskripsi: json['deskripsi']
    );
  }

  // Method to cobvert object to json
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'nama' : nama,
      'harga' : harga,
      'imgUrl' : imgUrl,
      'deskripsi' : deskripsi
    };
  }
}
```

#### Navigation
Dalam Flutter, navigation merujuk pada cara berpindah antar halaman (atau tampilan) di aplikasi. Sistem navigasi di Flutter berbasis route dan navigator. Setiap halaman atau layar di Flutter disebut sebagai route, dan Navigator adalah widget yang mengelola stack dari route tersebut. Berikut ini contoh penerapan code untuk memanfaatkan navigation. Sebelum itu, harus siapkan terlebih dahulu beberapa file yang dibutuhkan seperti main.dart, mypage.dart, dan juga detail.dart . Untuk file yang berisi model class, dapat menggunakan file yang sudah dibuat di atas tadi.
1) main.dart
```
import 'package:flutter/material.dart';
import 'package:praktikum_07/pages/mypage.dart';

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
      home: Mypage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

```

2) mypage.dart
```
import 'package:flutter/material.dart';
import 'package:praktikum_07/models/product.dart';
import 'package:praktikum_07/pages/detail.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 300000.00,
        imgUrl:
            'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
        deskripsi: 'Mouse agak mahal '),
    Product(
        id: 1,
        nama: 'Keynoard Mechanical',
        harga: 650000.00,
        imgUrl:
            'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
        deskripsi: 'Ini Keyboard gaming yang bagus'),
    Product(
        id: 1,
        nama: 'Iem',
        harga: 330000.00,
        imgUrl:
            'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/6/22/b528a4bc-fafd-496e-a0d5-739116e1d626.jpg',
        deskripsi: 'Ini IEM bagus bro'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Page'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Image.network(
                  product.imgUrl,
                  width: 70,
                  height: 70,
                ),
                title: Text(product.nama),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Harga : ${product.harga}'),
                    Text(product.deskripsi)
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailProduk(
                                data: "Ini Halaman Detail",
                              )));
                },
              );
            }));
  }
}

```

3) detail.dart
```
import 'package:flutter/material.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ini Adalah Detail'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
```

4) Berikut ini hasil output dari code di atas. Ketika kita menekan salah satu item, maka akan langsung diarahkan ke detail activity.<br>
![guided-main](https://github.com/user-attachments/assets/c87973bf-0d8b-4f97-a4b0-8cfa8966bb65)
![guided-detail](https://github.com/user-attachments/assets/2e529feb-7076-4515-859b-ca1d26596efc)


#### Notification 
Digunakan untuk memunculkan notifikasi pada aplikasi yang dibuat menggunakan Flutter.


### Unguided

#### Soal 

Membuat sebuah project untuk menampilkan beberapa produk dan halaman e-commerce dengan menerapkan class model serta navigasi. Oleh karena itu, saya akan mengembangkan hasil dari guided selama praktikum berlangsung. Berikut beberapa file yang saya gunakan untuk membuat aplikasi yang sesuai dengan perintah soal beserta codenya yaitu:
1) main.dart
```
import 'package:flutter/material.dart';
import 'package:unguided_praktikum07/pages/my_page.dart';

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
      home: MyPage(),
    );
  }
}
```
2) products.dart
```
class Product {
  final int id;
  final String nama;
  final double harga;
  final String imgUrl;
  final String deskripsi;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.imgUrl,
    required this.deskripsi
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      imgUrl: json['imgUrl'],
      deskripsi: json['deskripsi']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'imgUrl': imgUrl,
      'deskripsi': deskripsi
    };
  }
}
```
3) my_page.dart
```
import 'package:flutter/material.dart';
import 'package:unguided_praktikum07/models/products.dart';
import 'package:unguided_praktikum07/pages/detail_product.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 300000.00,
        imgUrl:
            'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
        deskripsi: 'Mouse mahal tapi bukan mouse gaming yang biasa dipakai buat game FPS'),
    Product(
        id: 2,
        nama: 'Keynoard Mechanical',
        harga: 650000.00,
        imgUrl:
            'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
        deskripsi: 'Ini Keyboard mechanical yang mahal tapi biasa dipakai buat game MOBA, bukan buat game FPS. Buat kantor cocok soalnya layout full size'),
    Product(
        id: 3,
        nama: 'Iem',
        harga: 330000.00,
        imgUrl:
            'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/6/22/b528a4bc-fafd-496e-a0d5-739116e1d626.jpg',
        deskripsi: 'Ini IEM bagus bro, pake ini auto jago mendengarkan step musuh'),
    Product(
        id: 4,
        nama: 'Monitor MSI',
        harga: 1330000.00,
        imgUrl:
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//catalog-image/97/MTA-115461772/msi_led_monitor_msi_pro_mp223_21-45-_fhd_100hz_1ms_fhd_hdmi_d-sub_-_mp_223_full01_mp9fz5lc.jpg',
        deskripsi: 'Pake monitor ini, auto rank up ke Radiant dan masuk top 100 untuk server SEA di Valorant'),
    Product(
        id: 5,
        nama: 'Gamepad',
        harga: 430000.00,
        imgUrl:
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/106/MTA-167843671/no-brand_no-brand_full01.jpg',
        deskripsi: 'Beli ini, auto win main EA FC25'),
    Product(
        id: 6,
        nama: 'Smartwatch Amazfit',
        harga: 3600000.00,
        imgUrl:
            'https://www.xiaomitoday.it/wp-content/uploads/2024/08/Amazfit-T-Rex-3-ce-specifiche-te.jpg',
        deskripsi: 'Ini sangat rekomen soalnya bagus banget'),
    Product(
        id: 7,
        nama: 'Helm',
        harga: 450000.00,
        imgUrl:
            'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//1050/kyt_kyt-rc-seven--15-italy-full-face-helm-motor---white_full05.jpg',
        deskripsi: 'Ini helm sangat bagus, nyaman untuk berkendara jarak jauh dan pastinya sangat nyaman untuk digunakan'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotibowif Mart'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.imgUrl,
              width: 100,
              height: 100,
            ),
            title: Text(product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga : ${product.harga}'),
                Text(product.deskripsi)
              ],
            ),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => MyDetailProducts(
                    products: product,
                  )
                )
              );
            },
          );
        }
      ),
    );
  }
}
```
4) detail_product.dart
```
import 'package:flutter/material.dart';
import 'package:unguided_praktikum07/models/products.dart';

class MyDetailProducts extends StatelessWidget {
  const MyDetailProducts({super.key, required this.products});
  final Product products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products.nama),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              products.imgUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              products.nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Harga : ${products.harga}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              products.deskripsi,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
Saya hanya mengimplementasikan materi yang sudah dipelajari dan juga saya mencoba ketika item ditekan oleh user, lalu diarahkan ke detail activity, maka tampilan yang akan terlihat adalah detail dari item tersebut. Tidak hanya itu, untuk judul pada halaman detail juga mengikuti nama dari item yang ditekan oleh user.

Berikut ini hasil Running code tersebut<br>
![unguided-main](https://github.com/user-attachments/assets/b585fdc0-9b31-41da-b813-4468b3ab3fe7)
![ungaided_helm](https://github.com/user-attachments/assets/44846710-dc32-4c8c-bebd-7c44ede4b070)
![ungaided_mouse](https://github.com/user-attachments/assets/1c906cdf-2b7d-4050-b0d3-3a03bf5901f7)
![ungaided_keyboard](https://github.com/user-attachments/assets/106b5915-06d1-4943-a4d7-39700d7a7df4)
![ungaided_iem](https://github.com/user-attachments/assets/db289ac9-d090-4de5-bb46-ada552528187)
![ungaided_monitor](https://github.com/user-attachments/assets/6289804f-d245-4ed3-a34f-b31c4572f723)
![ungaided_gamepad](https://github.com/user-attachments/assets/e165715d-3f7c-4239-8643-20514e7b5f37)
![ungaided_smartwatch](https://github.com/user-attachments/assets/50065cc3-6344-4c1d-8ef0-79698b614743)