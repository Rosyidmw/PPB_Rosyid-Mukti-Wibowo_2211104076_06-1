# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 10 Data Storage Bagian 1

Disusun Oleh : <br>
Nama : Rosyid Mukti Wibowo <br>
NIM : 2211104076 <br>
Kelas : SE-06-01 <br>
<br>
Asisten Praktikum : <br>
Muhammad Faza Zulian Gesit Al Barru <br>
Aisyah Hasna Aulia <br>
Dosen Pengampu : Yudha Islami Sulistya, S.Kom., M.Cs.

#### Program Studi S1 Software Engineering
#### Fakultas Informatika
#### Telkom University Purwokerto
#### 2024


### Tugas Pendahuluan

#### SOAL NOMOR 1
Jelaskan secara singkat fungsi SQLite dalam pengembangan aplikasi mobile!
- Jawab : SQLite adalah sebuah database open source yang ringan dan biasa digunakan di Android. SQLite sendiri memiliki beberapa fungsi diantaranya sebagai penyimpanan data lokal jika data yang diperoleh dari server sehingga data masih dapat ditampilkan walaupun tidak terkoneksi dengan internet. Efisien, tidak banyak memakan konsumsi RAM pada device, mudah digunakan, dukungan operasi SQL, serta integrasi yang mudah saat ingin menggunakan SQLite.

#### SOAL NOMOR 2
Apa saja yang dimaksud dengan operasi CRUD? Berikan penjelasan singkat untuk masing-masing operasi!
- Jawab : Operasi CRUD adalah operasi yang memiliki 4 operasi yaitu Create, Read, Update, dan Delete. Adapun fungsi dari 4 hal tersebut yaitu :
1) Create   : Operasi untuk menambahkan data baru ke dalam databse, Contoh menambahkan pengguna baru ke tabel users.
2) Read     : Operasi untuk membaca data dari database. Contoh mengambil atau membaca semua pengguna dari tabel users.
3) Update   : Operasi untuk memperbarui data yang sudah ada di database. Contoh mengubah nama user yang typo pada tabel users.
4) Delete   : Operasi untuk menghapus data dari database. Contoh menghapus pengguna tertentu dari tabel users.

#### SOAL NOMOR 3
Tuliskan kode SQL untuk membuat tabel bernama **users** dengan kolom berikut : <br>
- id (integer, primary key, auto increment)
- name (text)
- email (text)
- createdAt (timestamp, default value adalah waktu sekarang)
Jawab : Kode SQL sebagai berikut :
```
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### SOAL NOMOR 4
Sebutkan langkah-langkah utama untuk menggunakan plugin sqflite di dalam Flutter!
Jawab : 
1) Tambahkan package ini ke dalam file pubspec.yaml
```
sqflite: ^2.4.1
```
2) Lalu import kan package tersebut ke dalam file .dart yang sudah kita gunakan
```
import 'package:sqflite/sqflite.dart';
```
3) Jangan lupa inisialisasikan database yang akan dibuat
```
var db = await openDatabase('my_db.db');
```
4) Lalu buat sebuah database seperti contoh berikut
```
// Get a location using getDatabasesPath
var databasesPath = await getDatabasesPath();
String path = join(databasesPath, 'demo.db');

// Delete the database
await deleteDatabase(path);

// open the database
Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
  // When creating the db, create the table
  await db.execute(
      'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
});

// Insert some records in a transaction
await database.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
  print('inserted1: $id1');
  int id2 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
      ['another name', 12345678, 3.1416]);
  print('inserted2: $id2');
});

// Update some record
int count = await database.rawUpdate(
    'UPDATE Test SET name = ?, value = ? WHERE name = ?',
    ['updated name', '9876', 'some name']);
print('updated: $count');

// Get the records
List<Map> list = await database.rawQuery('SELECT * FROM Test');
List<Map> expectedList = [
  {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
  {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
];
print(list);
print(expectedList);
assert(const DeepCollectionEquality().equals(list, expectedList));

// Count the records
count = Sqflite
    .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
assert(count == 2);

// Delete a record
count = await database
    .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
assert(count == 1);

// Close the database
await database.close();
```
5) Bisa juga dengan menggunakan SQL Helpers
```
final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';

class Todo {
  int id;
  String title;
  bool done;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Todo();

  Todo.fromMap(Map<String, Object?> map) {
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone] == 1;
  }
}

class TodoProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnDone integer not null)
''');
    });
  }

  Future<Todo> insert(Todo todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<Todo> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}
```

#### SOAL NOMOR 5
Lengkapi kode berikut untuk membaca semua data dari tabel users menggunakan sqflite.
```
static Future<List<Map<String, dynamic>>> getUsers() async { 
    final db = await SQLHelper.db(); 
    return db.query(__________); 
} 
```
- Jawab : Berikut adalah kode lengkap agar dapat membaca semua data dari tabel users
```
static Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await SQLHelper.db();
  return db.query('users'); // Menyebutkan nama tabel
}
```