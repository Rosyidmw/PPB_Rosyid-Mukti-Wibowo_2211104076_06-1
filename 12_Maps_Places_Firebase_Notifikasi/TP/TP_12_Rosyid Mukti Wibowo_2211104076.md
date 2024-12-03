# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 12 Maps, Places, dan Firebase Notifikasi Bagian

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
Menambahkan Google Mpas Package
a. Apa nama package yang digunakan untuk mengintegrasikan Google Maps di Flutter dan sebutkan lengkah-langkah yang diperlukan untuk menambahlan package Google Maps ke dalam proyek Flutter
b. Mengapa kita perlu menambahkan API Key, dan di mana API Key tersebut diatur dalam aplikasi Flutter?
Jawab : Jawaban Untuk pertanyaan tersebut :
1) Nama package yang digunakan adalah Google maps flutter. Langkah pertama adalah cari package Google Maps Flutter di [pub.dev](https://pub.dev/), lalu importkan pada file pubspec.yaml. Bisa juga menambahkan lewat Add: Dependency yang sudah disediakan oleh VS Code.
```
google_maps_flutter: ^2.10.0
```
Lalu setelah berhasil menambahkan package, pastikan kembali dengan mengetikkan flutter pub get pada terminal
```
flutter pub get
```
2) API Key digunakan untuk mengautentikasi permintaan ke layanan Google Maps, memastikan akses dan mencegah penyalahgunaan layanan. Lalu API Key tersebut diatur dalam AndroidManifest.xml, dan tambahkan code berikut di dalam <application> pada AndroidManifest.xml
```
<meta-data android:name="com.google.android.geo.API_KEY" 
            android:value="YOUR_API_KEY"/>
```


#### SOAL NOMOR 2
Menampilkan Google Maps 
a. Tuliskan kode untuk menampilkan Google Map di Flutter menggunakan widget GoogleMap. 
b. Bagaimana cara menentukan posisi awal kamera (camera position) pada Google Maps di Flutter? 
c. Sebutkan properti utama dari widget GoogleMap dan fungsinya. 
Jawab : <br>
1) Berikut ini code untuk menampilkan Google Map di Flutter menggunakan widget GoogleMap :
```
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  static final LatLng _kMapCenter =
      LatLng(-7.431391, 109.247833);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps in FLutter'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
      ),
    );
  }
}
```
2) Cara menentukan posisi awal kamera (camera position) :
```
static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
```

3) Properti utama dari widget GoogleMap dan fungsinya :
- initialCameraPosition: Menentukan posisi awal kamera.
- markers: Kumpulan marker yang akan ditampilkan.
- onMapCreated: Callback ketika map telah dibuat.
- mapType: Menentukan jenis peta (normal, hybrid, terrain, satellite).
- myLocationEnabled: Menampilkan lokasi pengguna pada peta


#### SOAL NOMOR 3
Menambahkan Marker 
a. Tuliskan kode untuk menambahkan marker di posisi tertentu (latitude: -6.2088, longitude: 106.8456) pada Google Maps. 
b. Bagaimana cara menampilkan info window saat marker diklik?
Jawab : 
1) Code untuk menambahkan marker di posisi tertentu pada Google Maps
```
Set<Marker> _markers = {
  Marker(
    markerId: MarkerId("jakarta_marker"),
    position: LatLng(-6.2088, 106.8456),
    infoWindow: InfoWindow(title: "Jakarta"),
  ),
};

GoogleMap(
  initialCameraPosition: CameraPosition(
    target: LatLng(-6.2088, 106.8456),
    zoom: 10.0,
  ),
  markers: _markers,
);

Bisa Juga Menggunakan
body: PlacePicker(apiKey: "AIzaSyCk-Xn1tjqaWbwJGw1h9HBxHuXJuUUQCt8",
        onPlacePicked: (LocationResult result) {
          debugPrint("Place picked : ${result.formattedAddress}");
        },
        initialLocation: const LatLng(
          -6.2088, 106.8456
        ),
        searchInputConfig: const SearchInputConfig(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          autofocus: false,
          textDirection: TextDirection.ltr,
        ),
        searchInputDecorationConfig: const SearchInputDecorationConfig(
          hintText: "Search for a building, street or ...",
        ),
        enableNearbyPlaces: true,
        showSearchInput: true,
      ),
```
2) Cara menampilkan info Window saat Marker diklik
```
Marker(
  markerId: MarkerId("jakarta_marker"),
  position: LatLng(-6.2088, 106.8456),
  infoWindow: InfoWindow(
    title: "Jakarta",
    snippet: "Ibu Kota Indonesia",
  ),
);
```

#### SOAL NOMOR 4
Menggunakan Place Picker 
a. Apa itu Place Picker, dan bagaimana cara kerjanya di Flutter dan sebutkan nama package yang digunakan untuk implementasi Place Picker di Flutter. 
b. Tuliskan kode untuk menampilkan Place Picker, lalu kembalikan lokasi yang dipilih oleh pengguna dalam bentuk latitude dan longitude.
Jawab :
1) Definisi : Place Picker adalah fitur yang memungkinkan pengguna untuk memilih lokasi dari peta interaktif. Cara kerja : Fitur ini memanfaatkan layanan Google Places untuk menyediakan lokasi yang dipilih oleh pengguna. Nama Package: place_picker_google
```
place_picker_google: ^0.0.13
```

2) Code untuk menampilkan Place Picker, lalu mengembalikan lokasi dipilih oleh pengguna dalam bentuk latitude dan longitude
```
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlacePickerScreen(),
    );
  }
}

class PlacePickerScreen extends StatefulWidget {
  @override
  _PlacePickerScreenState createState() => _PlacePickerScreenState();
}

class _PlacePickerScreenState extends State<PlacePickerScreen> {
  final String apiKey = "YOUR_API_KEY";
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Place Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              PickResult result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlacePicker(
                    apiKey: apiKey,
                    initialPosition: LatLng(-6.2088, 106.8456),
                    useCurrentLocation: true,
                    onPlacePicked: (result) {
                      setState(() {
                        selectedLocation =
                            "Lat: ${result.geometry.location.lat}, Lng: ${result.geometry.location.lng}";
                      });
                      Navigator.of(context).pop(result);
                    },
                  ),
                ),
              );
            },
            child: Text("Pilih Lokasi"),
          ),
          if (selectedLocation != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Lokasi Terpilih: $selectedLocation",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
```