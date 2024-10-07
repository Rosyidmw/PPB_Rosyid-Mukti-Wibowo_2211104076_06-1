String sapaan(String nama) {
  return "Halo, $nama!";
}

// Menambah parameter
void greet(String name, int age) { 
  print('Hello $name, you are $age years old.'); 
}

void main() {
  String pesan = sapaan("Rosyid");
  print(pesan);

  greet('Rosyid Mukti Wibowo', 20);
}