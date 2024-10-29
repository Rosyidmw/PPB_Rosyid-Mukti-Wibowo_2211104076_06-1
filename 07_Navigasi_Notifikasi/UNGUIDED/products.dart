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