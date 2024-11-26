# Laporan Praktikum Pemrograman Perangkat Bergerak 

## Nama : Rosyid Mukti Wibowo
## NIM : 2211104076 
## Kelas : SE-06-01 

### Laporan Praktikum Pertemuan 10 Data Storage Bagian 1

### Guided
#### Firebase Cloud Messaging
Firebase Cloud Messaging (FCM) adalah layanan yang digunakan untuk mengirimkan notifikasi dengan mudah ke banyak pengguna sekaligus. Dengan FCM, Kita dapat mengirimkan pesan baik ke perangkat individu maupun ke grup pengguna yang berlangganan topik tertentu. Dokumentasi lengkapnya dapat diakses di [Dokumentasi](https://firebase.google.com/docs/flutter/setup?platform=android) <br> 
Agar dapat mengirim pesan, Kita perlu: 
1. Mendapatkan token unik dari setiap perangkat pengguna. 
2. Atau mengelompokkan pengguna berdasarkan topik tertentu (misalnya "promo" atau "berita"). 
Setelah itu, notifikasi dapat dikirim menggunakan Firebase Cloud Functions.  

#### Jenis Pesan pada Firebase Cloud Messaging (FCM)
FCM memiliki dua jenis pesan utama yang digunakan untuk kebutuhan notifikasi, yaitu: 
1) Notification Message 
Pesan ini digunakan untuk langsung menampilkan notifikasi di perangkat pengguna. Cara kerja: 
- Jika aplikasi berjalan di latar depan (foreground), pesan diteruskan ke fungsi onMessage untuk diproses. 
- Jika aplikasi di latar belakang (background) atau dimatikan (terminated), notifikasi akan langsung muncul di tray notifikasi perangkat tanpa memerlukan kode tambahan. 
2) Data Message 
Pesan ini memberikan lebih banyak fleksibilitas karena isinya tidak langsung ditampilkan sebagai notifikasi. 
Cara kerja:
- Pesan ini akan diproses oleh aplikasi, baik saat aplikasi aktif maupun tidak aktif.
- Untuk menampilkan notifikasi ke pengguna, Kita perlu menambahkan kode khusus, biasanya menggunakan plugin seperti flutter_local_notifications.

#### Konfigurasi Firebase
1) Daftar dan login pada [Firebase](https://console.firebase.google.com/), lalu buat project baru
![login_firebase](https://github.com/user-attachments/assets/b82abc69-96aa-46f8-a95c-b5f87aebd275)

2) Isikan semua data dan ikuti sesuai dengan modul yang ada hinggal terdownload sebuah file google-service.json, lalu ikuti modul untuk menyimpan file tersebut
![google-service-json](https://github.com/user-attachments/assets/817136e8-f2e9-4079-970d-fce20e70261b)

#### Praktikum
1) Buat project baru, lalu buat notifikasi handler pada file main.dart. Jangan lupa juga untuk menambahkan packages yang dibutuhkan untuk membuat project ini. Maka file main.dart akan seperti ini :
```
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:praktikum_11/my_notofication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

String? token;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description:
      'This channel is used for important notifications.', // Deskripsi Channel
  importance: Importance.high, // Prioritas
);

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
      home: MyNotificationScreen(),
    );
  }
}
```
2) Buat sebuah file baru bernama my_notification_screen.dart, lalu konfigurasikan untuk menangani notifikasi. Keseluruhan code pada file my_notification_screen.dart seperti berikut :
```
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:praktikum_11/main.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  @override
  void initState() {
    super.initState();

    // Membuat pengaturan inisialisasi notifikasi untuk Android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);

     //  Mendengarkan pesan saat aplikasi aktif 
    FirebaseMessaging.onMessage.listen((RemoteMessage message) { 
      RemoteNotification? notification = message.notification; 
      AndroidNotification? android = message.notification?.android; 
 
      // Jika notifikasi tersedia, tampilkan menggunakan notifikasi lokal 
      if (notification != null && android != null) { 
        FlutterLocalNotificationsPlugin().show( 
          notification.hashCode, // ID notifikasi (hashCode untuk unik) 
          notification.title, // Judul notifikasi 
          notification.body, // Isi notifikasi 
          NotificationDetails( 
            android: AndroidNotificationDetails( 
              channel.id, 
              channel.name, 
              channelDescription: channel.description, 
              color: Colors.blue, 
              icon: "@mipmap/ic_launcher", 
            ), 
          ), 
        ); 
      } 
    });

     //  Menangani aksi ketika notifikasi dibuka 
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) { 
      RemoteNotification? notification = message.notification; 
      AndroidNotification? android = message.notification?.android; 
 
      // Jika notifikasi tersedia, tampilkan dialog 
      if (notification != null && android != null) { 
        showDialog( 
          context: context, 
          builder: (_) { 
            return AlertDialog( 
              title: Text(notification.title ?? ""), // Judul dialog 
              content: SingleChildScrollView( 
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [Text(notification.body ?? "")], // Isi dialog 
                ), 
              ), 
            ); 
          }, 
        ); 
      } 
    });

    // Memanggil metode untuk mengambil token FCM perangkat 
    getToken(); 
  }
  // Metode untuk mendapatkan token FCM 
  void getToken() async { 
    token = await FirebaseMessaging.instance 
        .getToken(); // Mendapatkan token FCM perangkat 
    print('FCM Token: $token'); // Menampilkan token di log 
  }  
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan FCM'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mendapatkan notifikasi'),
          ],
        ),
      ),
    );
  }
}
```

3) Setelah selesai, maka running terlebih dahulu aplikasi yang sudah kita buat untuk mendapatkan token yang nantinya akan digunakan untuk keperluan notifikasi. Setelah mendapatkan token, maka kita melakukan konfigurasi pada Cloud Messaging untuk membuat firebase notification messages. Lalu isikan semua keperluan yang diminta, dan tekan tombol send test message agar notifikasi dapat masuk ke dalam emulator. Jangan lupa untuk mengaktifkan permission untuk notifikasi.
![aktifin_permission](https://github.com/user-attachments/assets/f4c25bcf-5e16-45bf-adcb-a89f5e5aad4c)

Hasil output dari code tersebut<br>
![guided_notification](https://github.com/user-attachments/assets/0bfc587d-fccc-4531-a152-0e4437e1d00e)

### Unguided

#### Soal 

Modifikasi Guided diatas bisa menampilkan Nama, Nim, Kelas, dan Prodi kalian ke dalam Notifikasi Flutter Cloud Messaging dan landing page notifikasinya. <br>
Untuk file yang digunakan sama persis dengan Guided, tidak ada perubahan apapun. Yang berbeda hanya konfigurasi pesan pada Firebase. Berikut konfigurasi pesan pada Firebase :
![configure_firebase](https://github.com/user-attachments/assets/79940ffb-69ca-496b-9668-c133cd5ac57c)

Berikut ini hasil Running code tersebut<br>
![unguided_notification](https://github.com/user-attachments/assets/4a317466-2e67-4e56-8084-fd5d34204a8f)
![unguided_dialog](https://github.com/user-attachments/assets/3a42ceb8-af71-471a-8caf-608e819095a3)

<br>
Pada Unguided kali ini, hanya melakukan perubahan pada konfigurasi isi dari notifikasi yang dikirim. Tidak ada perubahan code apapun, dan ketika notifikasi ditekan maka langsung diarahkan ke dalam aplikasi dan langsung terdapat dialog yang menampilkan Notification title dan juga Notification text yang sudah kita isikan pada saat konfigurasi di website Firebase.