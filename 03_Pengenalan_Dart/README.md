# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 3 Pengenalan Dart

### Guided
#### Apa itu Dart?
Dart adalah bahasa pemrograman yang open source dan general purpose. Dart dikembangkan oleh Google dan ditujukan untuk membuat aplikasi multiplatform seperti mobile, desktop, dan web. Dart merupakan bahasa modern dan berfitur lengkap. Dart juga memiliki banyak kemiripan dengan bahasa lain yang sudah banyak dikenal seperti Java, C#, Javascript, Swift, dan Kotlin. Contoh code dan output :
![main_dart](https://github.com/user-attachments/assets/cd739eab-e1e7-443d-8074-c4053bfa1e84)

#### Variable
var adalah cara untuk mendeklarasikan variabel tanpa menentukan tipe datanya secara eksplisit. Dart akan secara otomatis menentukan tipe data berdasarkan nilai yang diberikan. Contoh code dan outputnya : 
![variable](https://github.com/user-attachments/assets/5c63d2d2-09d7-4c27-866c-89ea68e3d4a4)

#### If-Else Statement
Untuk memproses suatu kondisi dalam program, kita dapat menggunakan ekspresi if. Jika hasil dari ekspresi tersebut bernilai true (benar), maka blok kode di dalam if akan dijalankan. Namun, jika kondisi tersebut tidak terpenuhi atau bernilai false (salah), kita dapat menggunakan ekspresi else untuk mengeksekusi blok kode alternatif. Contoh code dan outputnya :
![if-else](https://github.com/user-attachments/assets/45361813-6e33-4e57-a345-3156a801b6e8)

#### Switch-Case
Switch-case digunakan untuk memilih salah satu dari banyak blok kode untuk dieksekusi berdasarkan nilai suatu ekspresi. Dengan switch-case, program dapat memeriksa variabel dan menjalankan kode yang sesuai dengan nilai yang diberikan. Jika tidak ada case yang cocok, blok default dapat digunakan untuk menangani nilai yang tidak terduga. Contoh code dan outputnya :
![switch-case](https://github.com/user-attachments/assets/cb1ef43d-641a-439a-b7e3-d1b2b7fe0481)

#### For Loops
Gunakan for loop saat kondisinya tau persis seberapa banyak looping akan dilakukan. Contoh code dan outputnya :
![for-loop](https://github.com/user-attachments/assets/048cf242-5a17-4b41-acfd-56af48fbe90e)

#### While Loops
Gunakan while loop saat kondisinya tidak tahu kapan perulangan akan berhenti. Contoh code dan outputnya :
![while-loop](https://github.com/user-attachments/assets/74c9fa8c-3198-402c-9cb8-827eb2a8d0f3)

#### Fixed Length List
List adalah tipe data yang digunakan untuk merepresentasikan koleksi nilai yang terurut. List dapat berisi elemen-elemen dengan tipe data yang sama atau berbeda. List dapat diinisialisasi dengan nilai-nilai yang diberikan, atau dapat dibuat kosong dan kemudian diisi kemudian. Contoh code dan outputnya :
![fixed-list](https://github.com/user-attachments/assets/7f3c5f79-fd6d-4c97-8577-b84612762c07)

#### Growable List
Gunakan growable list apabila memiliki banyak object yang tidak menentu atau banyaknya object yang terus bertambah.
![growable-list](https://github.com/user-attachments/assets/ebec6957-9e45-4566-a7a5-1f1609991a87)

#### Fungsi
Pada bahasa pemrograman yang mendukung Object Oriented Programming, fungsi atau prosedur memilki peranan yang sangat penting. Untuk menghasilkan kualitas kode yang sangat baik, programmer bisa menggunakan beberapa prinsip pemrograman yang umum digunakan seperti SOLID, KISS, YAGNI, dsb. Semua prinsip tersebut menjunjung tinggi separation of concern yang artinya setiap kodingan memiliki tanggung jawabnya sendiri dan mengurangi sebanyak mungkin boilerplate code. Contoh code dan outputnya :
![fungsi](https://github.com/user-attachments/assets/ecfe2bbf-46c4-4979-a72b-628943ed74c5)


### Unguided

#### Tugas Percabangan (Branching)
Code : 
``
import 'dart:io'; 

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
``

Output
![tugas1](https://github.com/user-attachments/assets/82e54187-43c1-4a37-a527-e1d8fc30c368)

#### Tugas Looping (Perulangan)
Code :
``
import 'dart:io';

void main() {
  print('Masukkan tinggi piramida: ');
  int tinggi = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= tinggi; i++) {
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(' ');
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write('*');
    }

    print(''); 
  }
}
``
Output :
![tugas2](https://github.com/user-attachments/assets/32fe9a59-0eb4-4e8a-8bfb-194ffdca9062)

#### Tugas Function
Code : 
``
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

``

Output : 
![tugas3](https://github.com/user-attachments/assets/ecba20b9-299d-46c0-9575-c4c1203d6a01)