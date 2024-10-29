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
