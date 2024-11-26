# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 11 Data Storage Bagian 2

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
1) Jelaskan apa yang dimaksud dengan Firebase
Jawab : Firebase adalah platform pengembangan aplikasi yang disediakan oleh Google, yang menyediakan berbagai layanan untuk membantu pengembang membuat, mengelola, dan meningkatkan aplikasi dengan lebih mudah. Firebase menawarkan solusi untuk backend, analitik, autentikasi, penyimpanan data, notifikasi, dan masih banyak lagi. Platform ini mendukung aplikasi lintas platform (Android, iOS, dan web).

2) Sebutkan tiga fitur utama Firebase beserta fungsinya masing-masing
Jawab : 
- Realtime Database -> Fungsi: Menyimpan data dalam format JSON dan menyinkronkan data secara real-time ke semua klien yang terhubung.
Penggunaan: Cocok untuk aplikasi yang membutuhkan pembaruan data langsung, seperti aplikasi obrolan atau papan skor.
- Firebase Authentication ->Fungsi: Memberikan layanan autentikasi pengguna menggunakan email/password, nomor telepon, atau penyedia pihak ketiga seperti Google, Facebook, dan Twitter.
Penggunaan: Mempermudah pengelolaan login dan keamanan pengguna dalam aplikasi.
- Cloud Firestore -> Fungsi: Database NoSQL yang dirancang untuk penyimpanan dan pengambilan data yang terstruktur dengan skalabilitas tinggi.
Penggunaan: Cocok untuk aplikasi yang memerlukan pencarian cepat atau data dengan struktur yang kompleks.

#### SOAL NOMOR 2
Notification Message vs Data Message. Jelaskan perbedaan antara Notification Message dan Data Message pada Firebase Cloud Messaging. Berikan contoh penggunaan untuk masing-masing jenis pesan. 
- Jawab :
1) Notification Message
- Definisi: Pesan yang dirancang untuk ditampilkan langsung sebagai notifikasi kepada pengguna tanpa memerlukan intervensi logika aplikasi.
Karakteristik: Ditampilkan secara otomatis oleh sistem jika aplikasi tidak sedang aktif. Berisi payload sederhana (judul, isi pesan, ikon).
- Contoh Penggunaan: Mengirim pengingat kepada pengguna untuk membuka aplikasi, seperti "Jangan lewatkan diskon hari ini!".

2) Definisi: Pesan yang berisi data mentah dalam bentuk pasangan kunci-nilai yang dapat diproses oleh aplikasi.
- Karakteristik: Tidak ditampilkan secara otomatis oleh sistem. Aplikasi bertanggung jawab untuk memproses dan menampilkan pesan.
- Contoh Penggunaan: Mengirim data khusus seperti status terbaru pesanan atau informasi pembaruan dari server.

#### SOAL NOMOR 3
Apa yang dimaksud dengan Firebase Cloud Messaging (FCM) Token, dan mengapa token ini penting untuk mengirim notifikasi ke aplikasi?
- Jawab : FCM Token adalah string unik yang dihasilkan oleh Firebase untuk setiap perangkat klien yang terhubung ke aplikasi. Token ini digunakan untuk mengidentifikasi perangkat secara unik agar Firebase dapat mengirim pesan atau notifikasi ke perangkat tersebut. FCM Token diperlukan untuk memastikan bahwa pesan atau notifikasi hanya dikirimkan ke perangkat yang sesuai. Dengan token ini, pengembang dapat:
- Mengirim notifikasi ke perangkat tertentu.
- Mengelompokkan perangkat berdasarkan token untuk kampanye notifikasi yang ditargetkan.

#### SOAL NOMOR 4
Jelaskan bagaimana Firebase Cloud Messaging menangani notifikasi dalam kondisi aplikasi berikut: <br>
a. Saat aplikasi berada di foreground. <br>
b. Saat aplikasi berada di background. <br>
c. Saat aplikasi dalam kondisi terminated. <br>
- Jawab : 
1) Saat Aplikasi berada di Foreground : Penanganan: Notification Message: Tidak secara otomatis ditampilkan di sistem tray. Data Message: Dikirim langsung ke aplikasi dan dapat ditangani di dalam kode untuk menampilkan notifikasi. Contoh: Aplikasi menampilkan banner kecil atau dialog saat notifikasi diterima.
2) Saat Aplikasi berada di Background : Penanganan: Notification Message: Ditampilkan secara otomatis oleh sistem sebagai notifikasi. Data Message: Disampaikan ke aplikasi saat pengguna membukanya. Contoh: Pengguna menerima notifikasi di bilah status, dan detailnya dimuat setelah aplikasi dibuka.
3) Saat Aplikasi dalam kondisi terminated : Penanganan: Notification Message: Ditampilkan oleh sistem seperti pada background. Data Message: Tidak disampaikan secara langsung hingga aplikasi dibuka dan koneksi ke FCM dipulihkan. Contoh: Aplikasi e-commerce mengirim notifikasi diskon, tetapi data tambahan hanya diambil setelah aplikasi dibuka.