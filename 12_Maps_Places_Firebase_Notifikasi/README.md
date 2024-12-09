# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 12 Maps dan Places

### Guided
#### Google Maps API
Google Maps API merupakan salah satu layanan dari Google untuk membantu developer menciptakan aplikasi yang menggunakan fitur peta atau maps. Pada Google Maps API kita dapat  memasang marker, menggunakan fitur route, mencari tempat, dan masih banyak lagi. Cara implementasi Google API pada flutter dapat dilakukan dengan menggunakan packages Google  Maps. Tahapan dalam menambahkan Google Maps API dapat mengikuti langkah-langkah berikut :  
1. Dapatkan API key melalui link berikut [Cloud Console](https://cloud.google.com/maps-platform/)
2. Selanjutnya, enable Google Map SDK di tiap platform yang akan menggunakan Google Maps. 
a. Pergi ke [Google Delevopers Console](https://console.cloud.google.com/)
b. Pilih project yang ingin menggunakan Google Maps 
c. Pilih pada navigation menu, lalu pilih “Google Maps” 
d. Pilih “APIs” di bawah menu Google Maps 
e. Untuk mengaktifkan Google Maps di Android, pilih “Maps SDK for Android” pada section “Additional APIs”, lalu pilih “ENABLE” 
f. Untuk mengaktifkan Google Maps di iOS, pilih “Maps SDK for iOS” pada section “Additional APIs”, lalu pilih “ENABLE” 
g. Pastikan bahwa APIs telah aktif pada section “Enabled APIs” 
h. Untuk lebih detail bisa cek di [Dokumrntasi](https://developers.google.com/maps/gmp-get-started)
3. Android
a. Set minSdkVersion di android/app/build.gradle menjadi 20
```
android 
defaultConfig {  
minSdkVersion 20  
} 
```
b. Tambahkan API key pada manifest aplikasi android/app/src/main/AndroidManifest.xml
```
<meta-data android:name="com.google.android.geo.API_KEY"  
android:value="YOUR KEY HERE"/>
```

#### Menambahkan package Google Maps dan menampilkan Google Maps
Setelah mengikuti langkah diatas, sekarang adalah langkah-langkah menambahkan Google Maps ke layar aplikasi Flutter:  
1. Pergi ke [PubDev](https://www.pub.dev) , lalu cari packages Google Maps. Nama packagesnya adalah google_maps_flutter. 
2. Cari versi yang paling terbaru lalu tambahkan pada file pubspec.yaml , tambahkan juga beberapa package yang akan dibutuhkan nantinya
```
    google_maps_flutter: ^2.10.0
    place_picker_google: ^0.0.13
```
3. Berikut Code main.dart
```
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum_12/home_screen.dart';

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
      home: MyHomeScreen()
    );
  }
}
```

4. Berikut code home_screen.dart
```
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

5. Output dari code 
![guided](https://github.com/user-attachments/assets/d1dcf1db-2372-47b9-b07c-9e34a2c623e7)

### Unguided

#### Soal 

Dari tugas guided yang telah dikerjakan, lanjutkan dari marker hingga ke bagian place picker untuk memberikan informasi mengenai lokasi yang ditunjuk di peta. <br>
Dalam mengerjakan ini, saya menggunakan package dari place_picker_google
```
place_picker_google: ^0.0.13
```

Berikut ini code dari main.dart
```
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum_12/place_picker_screen.dart';

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
      home: PlacePickerScreen()
    );
  }
}
```

Berikut ini code dari place_picker_screen. 
```
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacePickerScreen extends StatefulWidget {
  const PlacePickerScreen({super.key});

  @override
  State<PlacePickerScreen> createState() => PlacePickerScreenState();
}

class PlacePickerScreenState extends State<PlacePickerScreen> {
  String? _pickedAddress;
  List<String> _nearbyPlaces = [];

  Future<void> _fetchNearbyPlaces(LatLng location) async {
    const apiKey = "AIzaSyCk-Xn1tjqaWbwJGw1h9HBxHuXJuUUQCt8";
    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=500&key=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _nearbyPlaces = (data['results'] as List)
              .map((place) => place['name'] as String)
              .toList();
        });
      } else {
        throw Exception('Failed to load nearby places');
      }
    } catch (e) {
      debugPrint("Error fetching nearby places: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Picker'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: PlacePicker(
              apiKey: "AIzaSyCk-Xn1tjqaWbwJGw1h9HBxHuXJuUUQCt8",
              onPlacePicked: (LocationResult result) {
                setState(() {
                  _pickedAddress = result.formattedAddress ?? "No Address Available";
                });

                
                if (result.latLng != null) {
                  _fetchNearbyPlaces(result.latLng!);
                }
              },
              initialLocation: const LatLng(
                -7.4350662019925515,
                109.24915663879061,
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
          ),
          if (_pickedAddress != null || _nearbyPlaces.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Picked Location:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(_pickedAddress ?? "Loading address..."),
                  const SizedBox(height: 8),
                  const Text(
                    "Nearby Places:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ..._nearbyPlaces.map((place) => Text("- $place")).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
```


Berikut ini hasil Running code tersebut.<br>
![unguided](https://github.com/user-attachments/assets/7886d50c-c88b-46bf-ab0e-7f036a931995)

<br>
Pada Unguided kali ini, untuk nama lokasi dan rekomendasi lokasi disekitar tidak berhasil untuk ditampilkan dalam aplikasi. Namun untuk marker sudah berfungsi dengan baik.