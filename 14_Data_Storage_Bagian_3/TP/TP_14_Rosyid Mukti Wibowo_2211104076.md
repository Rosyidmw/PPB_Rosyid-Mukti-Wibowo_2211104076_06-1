# Tugas Pendahuluan Pemrograman Perangkat Bergerak
## MODUL 14 Data Storage 3

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
Sebutkan dan jelaskan dua jenis utama Web Service yang sering digunakan dalam pengembangan aplikasi.<br>
Jawab : 
1. REST (Representational State Transfer)
- REST adalah arsitektur berbasis sumber daya yang menggunakan protokol HTTP untuk komunikasi. REST sering digunakan karena sederhana dan ringan.
- Data dikirim dalam format seperti JSON atau XML.
- Operasi didasarkan pada metode HTTP standar seperti GET, POST, PUT, dan DELETE.
- Contoh penggunaan: API RESTful digunakan untuk aplikasi web atau mobile seperti layanan e-commerce dan media sosial.

2. SOAP (Simple Object Access Protocol)
- SOAP adalah protokol berbasis XML yang dirancang untuk komunikasi terstruktur antara klien dan server.
- SOAP lebih kompleks dibanding REST, tetapi memiliki fitur keamanan bawaan seperti WS-Security.
- Cocok untuk integrasi sistem besar yang membutuhkan tingkat keamanan dan keandalan tinggi, seperti layanan perbankan.

#### SOAL NOMOR 2
Apa yang dimaksud dengan Data Storage API, dan bagaimana API ini mempermudah pengelolaan data dalam aplikasi?  <br>
Jawab : Data Storage API adalah antarmuka yang memungkinkan aplikasi untuk menyimpan, mengakses, dan mengelola data di penyimpanan tertentu (lokal atau cloud). 
- Manfaat dalam Pengelolaan Data:
1. Abstraksi Penyimpanan: API ini mengabstraksi detail teknis penyimpanan sehingga pengembang tidak perlu berurusan langsung dengan mekanisme dasar penyimpanan data.
2. Kemudahan Sinkronisasi: Memungkinkan sinkronisasi data antara perangkat dan server dengan mudah, misalnya melalui Firebase Realtime Database.
3. Pengelolaan Akses Data: API menyediakan kontrol akses yang lebih baik melalui autentikasi dan otorisasi.
4. Skalabilitas: Mendukung penyimpanan dalam jumlah besar tanpa pengembang harus memikirkan infrastruktur di belakangnya.
- Contoh API penyimpanan data meliputi Firebase, Amazon S3, dan Google Cloud Storage.


#### SOAL NOMOR 3
Jelaskan bagaimana proses kerja komunikasi antara klien dan server dalam sebuah Web Service, mulai dari permintaan (request) hingga tanggapan (response). <br>
Jawab : 
1. Permintaan (Request):
- Klien (misalnya aplikasi) mengirim permintaan ke server melalui protokol HTTP/HTTPS.
- Permintaan ini mencakup metode HTTP (GET, POST, dll.), URL, header, dan body (jika diperlukan).

2. Proses di Server:
- Server menerima permintaan dan memprosesnya.
- Jika data diminta, server mengakses database atau sistem penyimpanan lain untuk mendapatkan data.
- Jika permintaan berupa pengiriman data, server akan memvalidasi dan menyimpan data tersebut.

3. Tanggapan (Response):
- Server mengirimkan tanggapan kembali ke klien dengan kode status HTTP (200 OK, 404 Not Found, dll.).
- Tanggapan juga mencakup data dalam format JSON, XML, atau lainnya sesuai dengan permintaan.

Rendering di Klien:
- Klien menerima tanggapan dan menggunakannya untuk menampilkan data atau melakukan tindakan lainnya.

#### SOAL NOMOR 4
Mengapa keamanan penting dalam penggunaan Web Service, dan metode apa saja yang dapat diterapkan untuk memastikan data tetap aman? <br>
Jawab : Keamanan dalam web service penting untuk melindungi data sensitif, mencegah akses tidak sah, dan memastikan integritas sistem. Jika keamanan tidak dijaga, risiko seperti kebocoran data, serangan DDoS, atau manipulasi data dapat terjadi. Metode untuk Memastikan Keamanan:
1. Enkripsi (SSL/TLS):
Menggunakan HTTPS untuk mengenkripsi data selama transmisi sehingga sulit diakses oleh pihak ketiga.

2. Autentikasi dan Otorisasi:
Menggunakan mekanisme seperti OAuth 2.0 atau API key untuk memastikan bahwa hanya pengguna yang sah yang dapat mengakses layanan.

3. Rate Limiting:
Membatasi jumlah permintaan yang dapat dilakukan oleh klien untuk mencegah penyalahgunaan atau serangan brute force.

4. Validasi Input:
Memastikan bahwa data yang dikirim ke server valid untuk mencegah serangan injeksi seperti SQL injection atau cross-site scripting (XSS).

5. Audit Log:
Mencatat semua aktivitas penting dalam log untuk mendeteksi dan merespons potensi ancaman dengan cepat.
Dengan kombinasi metode ini, keamanan web service dapat ditingkatkan secara signifikan.