import 'dart:io'; 


bool cekPrima(int n) {
  if (n <= 1) {
    return false; 
  }
  
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false; 
    }
  }
  
  return true; 
}

void main() {
  print("Masukkan sebuah bilangan bulat: ");
  String? input = stdin.readLineSync();
  
  if (input != null) {
    int angka = int.tryParse(input) ?? 0;
    if (cekPrima(angka)) {
      print("$angka adalah bilangan prima");
    } else {
      print("$angka bukan bilangan prima");
    }
  } else {
    print("Input tidak valid.");
  }
}
