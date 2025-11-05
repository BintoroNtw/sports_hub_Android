# sports_hub

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
   Widget Tree adalah representasi struktur dari seluruh UI (User Interface) Anda di Flutter. Bayangkan ini seperti pohon silsilah keluarga, tetapi untuk komponen UI. Setiap widget yang Anda buat, mulai dari MaterialApp di paling atas hingga Text atau Icon di paling bawah, adalah "simpul" (node) di pohon ini.
    Hubungan Parent-Child (Induk-Anak) adalah inti dari struktur ini:
    Parent (Induk): Adalah widget yang "membungkus" atau berisi widget lain. Contoh: Column adalah parent dari daftar widget di dalamnya (children).
    Child (Anak): Adalah widget yang berada di dalam widget lain. Contoh: Text adalah child dari Padding. Hubungan ini penting karena parent terkadang suka mengontrol (atau setidaknya memengaruhi) 
    tampilan atau posisi child-nya. Misalnya, Center (parent) akan memberitahu Text (child) untuk tampil di tengah layar. Column (parent) akan memberitahu anak-anaknya untuk berbaris secara vertikal.
2.Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
   MaterialApp
Ini adalah widget root yang membungkus seluruh aplikasimu. Fungsinya adalah menyediakan semua fitur dasar Material Design

Widget Layout (Penata Letak)
Fungsinya adalah memberikan "bantalan" atau jarak (ruang kosong) di sekitar widget child-nya.

Column
menyusun beberapa widget lain secara vertikal

Row
menyusun tiga InfoCard (NPM, Nama, Kelas) secara horizontal (dari kiri ke kanan).

Center
memposisikan Column (yang berisi teks "Selamat datang" dan GridView) agar berada di tengah layar.

SizedBox
sebagai "kotak kosong" yang tak terlihat untuk memberi jarak vertikal (spasi) yang pasti

GridView.count
menampilkan daftar items dalam format grid (petak)

Container
sebagai "kotak" pembungkus serbaguna. Di ItemCard, ini dipakai untuk memberi padding. Di InfoCard, ini dipakai untuk mengatur lebar (width) dan padding.

Icon
menampilkan ikon

MyApp
bertugas menjalankan MaterialApp

MyHomePage
Widget yang mewakili seluruh halaman utama, berisi Scaffold dan semua kontennya.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp adalah widget dasar yang membungkus seluruh aplikasi Anda untuk menyediakan fungsionalitas inti bergaya Material Design (gaya desain visual dari Google).

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan utamanya terletak pada kemampuan untuk berubah setelah widget tersebut dibuat, berdasarkan data internal.

StatelessWidget (Widget Statis)
Apa itu: Widget yang tidak memiliki "state" (memori) internal. Tampilannya murni ditentukan oleh data (konfigurasi) yang diberikan saat dibuat (melalui constructor-nya).
Sifat: Immutable (tidak bisa diubah). Sekali dibuat, tampilannya tidak akan pernah berubah kecuali data dari parent-nya berubah (yang menyebabkan widget ini dibuat ulang seluruhnya).
Kapan digunakan: Untuk tampilan yang statis atau hanya bergantung pada data dari luar. Contoh: Icon, Text (yang isinya tidak berubah), Container (yang warnanya tetap).
StatefulWidget (Widget Dinamis)
Apa itu: Widget yang memiliki "state" (memori) internal yang bisa berubah selama widget itu hidup.
Sifat: Mutable (bisa berubah). Ia memiliki objek State khusus untuk menyimpan data yang bisa berubah. Ketika data ini berubah (dengan memanggil setState()), Flutter akan otomatis membangun ulang (rebuild) widget tersebut dengan tampilan baru.
Kapan digunakan: Untuk tampilan yang perlu berubah secara dinamis berdasarkan interaksi pengguna atau data internal. Contoh: Checkbox (centang/tidak), TextField (input teks), slider, atau halaman yang mengambil data dari internet dan menampilkan loading spinner.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah "alamat" atau lokasi dari sebuah widget di dalam Widget Tree. Ia memberi tahu widget di mana posisinya relatif terhadap widget-widget lain.
BuildContext sangat penting karena ia adalah handle (pegangan) untuk berinteraksi dengan struktur pohon. Ia digunakan untuk menemukan widget parent atau data yang disediakan oleh parent.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot Reload (Pemuatan Ulang Cepat)
Apa yang dilakukan: Menyuntikkan file kode sumber yang baru diubah ke dalam Dart Virtual Machine (VM) yang sedang berjalan.
Kecepatan: Sangat cepat (biasanya kurang dari 1 detik).
State (Memori): Tidak hilang. Jika Anda sedang mengisi form atau berada di halaman ketiga, state tersebut akan tetap ada setelah hot reload.
Kapan digunakan: Paling sering digunakan (tombol petir ⚡ di VS Code/Android Studio). Ideal untuk mengubah tata letak UI, warna, teks, atau logika di dalam event handler.
Hot Restart (Mulai Ulang Cepat)
Apa yang dilakukan: Memuat ulang seluruh kode aplikasi dan memulai ulang aplikasi dari awal.
Kecepatan: Lebih lambat dari Hot Reload (beberapa detik), tetapi jauh lebih cepat daripada stop dan run (Full Restart).
State (Memori): Hilang (direset). Aplikasi akan kembali ke keadaan awal (halaman utama, form kosong).
Kapan digunakan: Diperlukan ketika Anda mengubah sesuatu yang fundamental, seperti mengubah constructor global, static variable, atau data inisialisasi awal (misalnya di main()) yang tidak bisa ditangani oleh Hot Reload.