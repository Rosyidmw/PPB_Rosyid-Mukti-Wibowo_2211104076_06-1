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

