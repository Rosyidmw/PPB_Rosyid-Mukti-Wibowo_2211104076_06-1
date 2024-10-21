# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 5 Antarmuka Pengguna Lanjutan

### Guided
#### ListView.builder
Widget ListView jenis ini cocok digunakan ketika memiliki data list yang lebih besar. ListView.builder membutuhkan itemBuilder dan itemCount. Parameter itemBuilder merupakan fungsi yang mengembalikan widget untuk ditampilkan. Sedangkan itemCount kita isi dengan jumlah seluruh item yang ingin ditampilkan. 

#### ListView.Separated
ListView jenis ini akan menampilkan daftar item yang dipisahkan dengan separator. Penggunaan ListView.separated mirip dengan builder, yang membedakan adalah terdapat satu parameter tambahan wajib yaitu separatorBuilder yang mengembalikan Widget yang akan berperan sebagai separator.

#### Flexible dan Expanded
1) Flexible
Flexible digunakan ketika Anda ingin memberikan ruang fleksibel kepada widget di dalam kolom atau baris. Dengan Flexible, widget dapat mengambil ruang yang tersisa di dalam layout, tetapi tetap memiliki batas maksimal yang disesuaikan dengan kebutuhan ruangnya. Berikut adalah contoh code yang menggunakan Flexible
```
import 'package:flutter/material.dart';

class FlexibleExpendedScreen extends StatelessWidget {
  const FlexibleExpendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Extended'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          const Text('Flexible'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.red,
                child: const Text('Ini tanpa flexible '),
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                  child: const Text('This is Flexible Widget, it takes up the remaining space but can shrink if needed'),
                )
              ),
              const Icon(Icons.sentiment_dissatisfied)
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          const Text('Expanded'),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: Colors.blue,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                  child: const Text('This is Expanded Widget, it force the widget to take up all the remaining app'),
                ),
              ),
              const Icon(Icons.sentiment_neutral)
            ],
          )
        ],
      ),
    );
  }
}
```
2) Expanded
Expanded adalah turunan dari Flexible yang secara otomatis mengisi semua ruang yang tersisa di dalam kolom atau baris. Ketika Anda menggunakan Expanded, widget tersebut akan mengambil ruang sebanyak mungkin tanpa memperhatikan kebutuhan ruang minimum.
```
import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        const Text('Sliver'),
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver App Bar',
                style: TextStyle(fontSize: 18),
                ),
            ),
          ),

          // SLiver Grid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20
              ), 
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0
            )
          ),

          // Sliver Fixed List
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
              childCount: 20
            ), 
            itemExtent: 50.0,
          )
        ],
      ),
    );
  }
}
```
Berikut adalah output penggunaan Flexible dan Expanded <br>
![guided_flex](https://github.com/user-attachments/assets/3b7d290f-de72-4075-97e4-713bcbb11ff7)


#### CustomScrollView
Widget ini memungkinkan membuat efek pada list, grid, maupun header yang lebar. Misalnya, ketika ingin membuat scroll view yang berisi app bar yang lebar yang meliputi list dan grid secara bersamaan, maka bisa menggunakan 3 widget sliver, yaitu SliverAppBar, SliverList, dan SliverGrid. 
Berikut adalah code penggunaan CustomScrollView
```
import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        const Text('Sliver'),
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver App Bar',
                style: TextStyle(fontSize: 18),
                ),
            ),
          ),

          // SLiver Grid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20
              ), 
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0
            )
          ),

          // Sliver Fixed List
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
              childCount: 20
            ), 
            itemExtent: 50.0,
          )
        ],
      ),
    );
  }
}
```
![guided_sliver](https://github.com/user-attachments/assets/933f5bfa-5d80-4b26-9a5b-82c05aa71b1d)
![guided_list](https://github.com/user-attachments/assets/f1ab2dab-568d-450b-b2b4-6a50718acd66)

### Unguided

#### Modifikasi Tugas Unguided 04 

Tugas Unguided 04 setelah dimodifikasi dengan mengimplementasikan widget CustomScrollView, SliverAppBar, dan SliverList
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
      home: const WisataPage(),
    );
  }

  
}


class WisataPage extends StatelessWidget {
  const WisataPage({super.key});

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Wisata Purwokerto',
                style: TextStyle(
                  color: Colors.white,),
              ),
              background: Image.network(
                'https://suarabanyumas.com/wp-content/uploads/2021/11/Alun-alun.jpg',
                fit: BoxFit.cover
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 99, 7, 185),
          ),
          // Sliver List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                {
                final tempat = wisata[index];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
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
                    )
                  );
                }
              },
              childCount: wisata.length,
            ) 
          )
        ],
      ),
    );
  }
}
```
Berikut ini hasil Running code tersebut pada Android Virtual Device <br>
![unguided1](https://github.com/user-attachments/assets/5ee218cb-dc3d-417c-8810-b5d5e7e31d15)
![unguided2](https://github.com/user-attachments/assets/2547e383-11a4-47ae-ad69-b97f4a9e9cb9)
![unguided3](https://github.com/user-attachments/assets/cdbb3b37-f24c-4c01-9ae6-a4bdefd7c079)

Program tersebut hanya melanjutkan dari Tugas Unguided 04. Namun, di dalamnya mengimplementasikan widget CustomScrollView, SliverAppBar, dan SliverList dalam menampilkan rekomendasi tempat wisata yang ada di Purwokerto.