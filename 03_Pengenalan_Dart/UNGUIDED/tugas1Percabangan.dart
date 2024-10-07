import 'dart:io'; // Import library untuk membaca input dari user

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "$nilai merupakan Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "$nilai merupakan Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "$nilai merupakan Nilai C";
  } else {
    return ""; 
  }
}

void main() {
  print("Masukkan nilai: ");
  String? input = stdin.readLineSync(); 
  if (input != null) {
    int nilai = int.tryParse(input) ?? 0; 
    String hasil = cekNilai(nilai); 
    if (hasil.isNotEmpty) {
      print(hasil); 
    } else {
      print("Input tidak valid."); 
    }
  }
}