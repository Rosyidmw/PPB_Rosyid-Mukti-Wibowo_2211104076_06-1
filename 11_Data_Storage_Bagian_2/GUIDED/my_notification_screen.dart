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
