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