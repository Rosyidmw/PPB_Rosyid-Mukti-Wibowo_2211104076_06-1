# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 10 Data Storage Bagian 1

### Guided
#### Pengenalan SQLite
SQLite adalah database relasional yang merupakan penyimpanan data secara offline untuk sebuah mobile app (pada local storage, lebih tepatnya pada cache memory aplikasi). SQLite memiliki CRUD (create, read, update dan delete). Empat operasi tersebut penting dalam sebuah penyimpanan. Untuk struktur database pada SQLite, sama seperti SQL pada umumnya, variabel dan tipe data yang dimiliki tidak jauh berbeda dengan SQL. 

#### SQL Helper Dasar
Dalam Flutter, SQL Helper biasanya merujuk pada penggunaan paket seperti sqflite untuk mengelola database SQLite. SQL Helper merupakan class untuk membuat beberapa method yang berkaitan dengan perubahan data. sqflite adalah plugin Flutter yang memungkinkan untuk melakukan operasi CRUD (Create, Read, Update, Delete) pada database SQLite. Untuk menggunakan SQLite, harus menambahkan 2 package yaitu sqflite dan path. <br>
Berikut ini code dari db_helper.dart
```
// import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  // Private constructor
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_prakdatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE my_table(
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
title TEXT,
description TEXT,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('my_table', row);
  }
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_table');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('my_table', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('my_table', where: 'id = ?', whereArgs: [id]);
  }
  
}
```
Lalu berikut ini code dari main.dart
```
import 'package:flutter/material.dart';
import 'package:praktikum_10/view/my_db_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyDatabaseView(),
    );
  }
}
```
Kode dari my_db_view.dart
```
import 'package:flutter/material.dart';
import 'package:praktikum_10/helper/db_helper.dart';

class MyDatabaseView extends StatefulWidget {
  const MyDatabaseView({super.key});

  @override
  State<MyDatabaseView> createState() => _MyDatabaseViewState();
}

class _MyDatabaseViewState extends State<MyDatabaseView> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _dbData = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void initState() {
    _refreshData();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // metode untuk memperbarui data dari database
  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _dbData = data;
    });
  }

  // metode untuk menambahkan data ke database
  void _addData() async {
    await dbHelper.insert({
      'title': _titleController.text,
      'description': _descriptionController.text
    });
    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  // memperbarui data
  void _updateData(int id) async {
    await dbHelper.update({
      'id': id,
      'title': _titleController.text,
      'description': _descriptionController.text
    });
    _titleController.clear();
    _descriptionController.clear();
    _refreshData();
  }

  // menghapus data
  void _deleteData(int id) async {
    await dbHelper.delete(id);
    _refreshData();
  }

  // menampilkan dialog untuk edit data
  void _showEditDialog(Map<String, dynamic> item) {
    _titleController.text = item['title'];
    _descriptionController.text = item['description'];

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Text'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    _updateData(item['id']);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Database - sqflite'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addData();
            },
            child: const Text('Add'),
          ),
         Expanded(child: 
         ListView.builder(itemCount: _dbData.length, itemBuilder: (context, index) {
           final item = _dbData[index];
           return ListTile(
             title: Text(item['title']),
             subtitle: Text(item['description']),
             trailing: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 IconButton(
                   icon: const Icon(Icons.edit),
                   onPressed: () {
                     _showEditDialog(item);
                   },
                 ),
                 IconButton(
                   icon: const Icon(Icons.delete),
                   onPressed: () {
                     _deleteData(item['id']);
                   },
                 ),
               ],
             ),
           );
         },))
        ],
      ),
    );
  }
}
```

- Hasil output dari code tersebut<br>
![guided_awal](https://github.com/user-attachments/assets/1812630d-2855-45a6-9c66-c9f8a4bcd3ac)
![guided_delete](https://github.com/user-attachments/assets/f01abbfb-1749-4b56-b491-96046ed34714)
![guided_update](https://github.com/user-attachments/assets/7f098822-1360-4129-ab5d-8fe6d1ee74d9)
![guided_updated](https://github.com/user-attachments/assets/0c21e8ac-25df-4c58-a0b0-1a5e9aee2a00)
![guided_after_update](https://github.com/user-attachments/assets/899fc226-db1c-493a-a935-3af3d17bb902)




### Unguided

#### Soal 

Buatlah sebuah project aplikasi Flutter dengan SQLite untuk menyimpan data biodata mahasiswa yang terdiri dari nama, NIM, domisili, dan hobi. Data yang dimasukkan melalui form akan ditampilkan dalam daftar di halaman utama. 
Alur Aplikasi: 
- Form Input: Buat form input untuk menambahkan biodata mahasiswa, dengan kolom:  
1) Nama 
2) Nim 
3) Alamat 
4) Hobi 
- Tampilkan Daftar Mahasiswa: Setelah data berhasil ditambahkan, tampilkan daftar 
semua data mahasiswa yang sudah disimpan di halaman utama. 
- Implementasikan fitur Create (untuk menyimpan data mahasiswa) dan Read (untuk 
menampilkan daftar mahasiswa yang sudah disimpan). 


1) main.dart
```
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unguided_10/view/my_main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyMainView(),
    );
  }
}
```
2) db_helper.dart
```
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;{
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mydb_unguided10.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE my_unguided10(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nama TEXT,
  nim TEXT,
  alamat TEXT,
  hobi TEXT)
''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('my_unguided10', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_unguided10');
  }

}
```

3) my_main_view.dart
```
import 'package:flutter/material.dart';
import 'package:unguided_10/helper/db_helper.dart';
import 'package:unguided_10/view/my_db_view.dart';

class MyMainView extends StatefulWidget {
  const MyMainView({super.key});

  @override
  State<MyMainView> createState() => _MyMainViewState();
}

class _MyMainViewState extends State<MyMainView> {
  List<Map<String, dynamic>> _dataList = [];

  Future<void> _fetchData() async {
    final data = await DatabaseHelper().queryAllRows();
    setState(() {
      _dataList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Biodata Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            final item = _dataList[index];
            return Card(
              child: ListTile(
                title: Text(item['nama']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NIM : ${item['nim']}'),
                    Text('Alamat : ${item['alamat']}'),
                    Text('Hobi : ${item['hobi']}')
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyDbView()));
          _fetchData();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
```

4) my_db_view.dart
```
import 'package:flutter/material.dart';
import 'package:unguided_10/helper/db_helper.dart';

class MyDbView extends StatefulWidget {
  const MyDbView({super.key});

  @override
  State<MyDbView> createState() => MyDbViewState();
}

class MyDbViewState extends State<MyDbView> {

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  Future<void> _saveData() async {
    if (_namaController.text.isNotEmpty &&
    _nimController.text.isNotEmpty &&
    _alamatController.text.isNotEmpty &&
    _hobiController.text.isNotEmpty) {
      final Map<String, dynamic> row = {
        'nama' : _namaController.text,
        'nim' : _nimController.text,
        'alamat' : _alamatController.text,
        'hobi' : _hobiController.text
      };

      await DatabaseHelper().insert(row);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua harus diisi!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Biodata Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.confirmation_number),
                labelText: 'Nim',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.home),
                labelText: 'Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _hobiController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.local_activity),
                labelText: 'Hobi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: _saveData,
            child: 
              const Text('Simpan', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

Pada unguided kali ini diharuskan membuat sebuah project baru untuk membuat sebuah program daftar mahasiswa yang harus diinputkan secara manual. Memanfaatkan sqflite pada flutter guna menyimpan data yang sudah diisi. Lalu akan ditampilkan dalam bentuk card untuk setiap data mahasiswa.

Berikut ini hasil Running code tersebut<br>
![unguided_main](https://github.com/user-attachments/assets/9445430b-b078-4855-affe-fc7fb98f4ce3)
![unguided_add_data](https://github.com/user-attachments/assets/f8ad1769-2ad9-4438-ae6e-721f8d6cb9ca)
![unguided_data_kosong](https://github.com/user-attachments/assets/681ca2d0-944d-45cd-b9f5-4170b8b11862)
![unguided_isi_data](https://github.com/user-attachments/assets/12f43144-06f3-41e3-9b49-9a9532972648)
![unguided_after_add](https://github.com/user-attachments/assets/c38e8758-9c8d-429c-8245-917419ea877a)