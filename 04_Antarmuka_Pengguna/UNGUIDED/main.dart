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
