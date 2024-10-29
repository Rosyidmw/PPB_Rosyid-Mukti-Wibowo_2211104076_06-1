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