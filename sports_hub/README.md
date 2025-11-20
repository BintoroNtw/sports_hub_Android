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


Tugas 8
1.Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator Push menambahkan rute (halaman) baru ke atas stack (tumpukan) navigasi. Halaman yang lama masih ada di bawahnya.Penggunaannya seperti pengguna dapat menekan tombol "back" di appbar untuk kembali ke halaman sebelumnya.
Di Sports hub digunakan untuk membuka halaman "tambah produk".
Navigatpr.pushReplacement() mengganti halaman saat ini di stack ke halaman yang baru.Halaman yang lama akan dihapus.Pengguna tidak bisa menekan tombol "back" untuk kembali kehalaman yang diganti.
Di sports hub digunakan saat drawer menekan tombol halaman utama.

2.Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Struktur hierarki ini adalah kunci untuk membangun UI yang konsisten:
Scaffold: Ini adalah "kerangka" dasar untuk setiap halaman. Dengan menggunakan Scaffold di menu.dart dan productList_form.dart, kami memastikan kedua halaman memiliki struktur visual yang sama (tahu di mana harus meletakkan AppBar, body, dan Drawer).
AppBar: Ini adalah header aplikasi. Dengan menempatkannya di properti appBar milik Scaffold, kami menjamin AppBar selalu muncul di bagian atas dengan gaya, warna (diambil dari ThemeData), dan tinggi yang konsisten. AppBar juga cukup pintar untuk secara otomatis menampilkan tombol drawer (hamburger) atau tombol "Back" tergantung pada tumpukan navigasi.
Drawer: Ini adalah menu navigasi global. Dengan membuat satu widget kustom (LeftDrawer) dan memberikannya ke properti drawer di setiap Scaffold (MyHomePage dan ProductFormPage), kami memastikan bahwa pengguna bisa mengakses menu navigasi yang sama persis dari halaman mana pun di aplikasi. Ini menciptakan pengalaman pengguna yang konsisten dan dapat diprediksi.
Semua ini menjadi template yg kami gunakan kembali di seluruh aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
   Dalam mendesain form di productList_form.dart, widget layout ini sangat penting:
Padding:
Kelebihan: Memberi "ruang bernapas" (whitespace) di sekitar elemen UI. Tanpa Padding, TextFormField dan tombol akan menempel langsung ke tepi layar dan satu sama lain, membuatnya terlihat berantakan dan sulit digunakan.
Contoh: Kami membungkus setiap TextFormField dengan Padding(padding: const EdgeInsets.all(8.0), ...) untuk memberi jarak yang rapi antar field input.
SingleChildScrollView:
Kelebihan: Ini adalah widget krusial untuk form. Saat pengguna mengetuk TextFormField (misalnya "Deskripsi"), keyboard akan muncul
dan menutupi bagian bawah layar. Tanpa SingleChildScrollView, field input atau tombol "Save" di bagian bawah akan tertutup oleh keyboard dan pengguna tidak bisa scroll, sehingga menyebabkan Bottom Overflow Error.
Contoh: Kami membungkus seluruh Form yang berisi Column dari TextFormField kami dengan SingleChildScrollView. Ini memastikan seluruh form bisa di-scroll ke atas saat keyboard muncul.
ListView:
Kelebihan: Mirip dengan SingleChildScrollView, ListView menyediakan scrolling otomatis. Kelebihan utamanya adalah efisiensi memori untuk daftar yang sangat panjang (karena me-render item sesuai kebutuhan), tetapi dalam konteks drawer kami, ListView digunakan untuk kesederhanaan.
Contoh: Di left_drawer.dart, ListView digunakan untuk menampung DrawerHeader dan ListTile ("Halaman Utama", "Tambah Produk"). Ini memastikan bahwa jika kami menambahkan lebih banyak menu di masa depan, drawer itu sendiri akan menjadi scrollable dan tidak akan overflow.
4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Dengan mendefinisikan primarySwatch (palet warna utama) sebagai Colors.blue di satu tempat, kami mendapatkan manfaat:
Konsistensi Otomatis: Widget Flutter seperti AppBar secara otomatis menggunakan warna primary dari tema ini sebagai background default-nya. Inilah sebabnya AppBar di menu.dart dan productList_form.dart memiliki warna yang sama tanpa perlu kami setel warnanya satu per satu.
Branding Terpusat: Jika suatu hari brand "Sports Hub" memutuskan untuk ganti warna dari biru menjadi hijau, kami tidak perlu mengedit puluhan file. Kami hanya perlu mengubah primarySwatch: Colors.blue menjadi primarySwatch: Colors.green di satu tempat (main.dart), dan seluruh aplikasi akan otomatis berganti warna.
Warna Aksen: Warna secondary (yang kami setel ke blueAccent) dapat digunakan untuk elemen interaktif seperti tombol atau toggle, menciptakan hierarki visual yang jelas.

Tugas 9
1.Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Ketika menerima/mengirim data JSON dari Django ke Flutter, kita perlu membuat model Dart agar struktur data lebih aman dan terkontrol.
Selain itu model memastikan setiap fieldmemiliki tipe yang benar, apabila menggnakan Map<String, dynamic>, semua data jadi dynamic, rawan error runtime.
Konsekuensi kita apabila menggunakan Map<String dynamic> tanpa model
rawan typo,tidak tahu tipe data,tidak null safe.
1. Mengapa perlu model Dart? Apa akibatnya kalau pakai Map saja?

Model Dart itu sebenarnya dipakai supaya data JSON yang kita terima atau kirim punya struktur yang jelas dan aman. Kalau langsung pakai Map<String, dynamic>, semuanya terasa gampang di awal, tapi rawan banget salah ketik key, salah tipe data, atau dapat null yang bikin aplikasi crash tanpa ketahuan. Dengan model, kita kayak dikasih “template” data yang fix, jadi Dart bisa ngecek tipe data sejak compile-time. Ini ngejaga null-safety dan bikin kode lebih terawat supaya kalau backend berubah, kita cepat tahu errornya, bukan pas user lagi klik tombol. Jadi sebenarnya bukan wajib sih, cuma kalau nggak dipakai, maintainability dan keamanan datanya bakal berantakan.
2. Apa fungsi http dan CookieRequest? Apa bedanya?
Package http itu ibarat alat standar untuk kirim GET/POST tanpa ada fitur tambahan—semua manual, termasuk cookie dan session. Sedangkan CookieRequest itu khusus banget buat Django karena dia otomatis nyimpen dan ngirim cookie session dari server. Jadi kalau login, Django bikin session, dan CookieRequest otomatis bawa cookie itu ke request berikutnya. Kalau pakai http, kita harus nyimpen cookie sendiri—ribet banget. Intinya, http itu general-purpose, sementara CookieRequest itu lebih “pintar” dan sudah siap dipakai buat autentikasi Django.
3. Mengapa CookieRequest harus dibagikan ke semua komponen?
CookieRequest harus dishare karena session login ada di dalam instance CookieRequest itu. Kalau tiap halaman punya instance sendiri, session-nya nggak kebawa, dan Flutter bakal mikir kita belum login. Makanya harus dibungkus pakai Provider di root widget, supaya semua halaman—dari login, list produk, sampai detail—pakai instance CookieRequest yang sama. Jadi ya semacam passbook identitas yang harus dibawa ke mana-mana biar Django kenal kita.
4. Mengapa perlu ALLOWED_HOSTS, CORS, SameSite, dan izin Internet Android?
Flutter dan Django sebenarnya saling komunikasi lewat Internet, tapi emulator Android itu punya alamat sendiri, bukan localhost, jadi harus pakai 10.0.2.2. Django pun harus diizinkan menerima alamat itu lewat ALLOWED_HOSTS, kalau tidak Django bakal menolak request. CORS juga harus dibuka sedikit supaya Android boleh mengambil data dari Django, karena kalau tidak bakal dianggap request lintas domain yang mencurigakan. Pengaturan SameSite/cookie diperlukan supaya cookie session bisa dikirim balik ke Django tanpa diblokir oleh aturan keamanan browser/OS. Dan AndroidManifest wajib menambahkan izin Internet, kalau tidak, aplikasinya tidak bisa request ke mana-mana. Kalau salah satu setting ini lupa, hasilnya request gagal, login nggak tersimpan, atau gambar/thumbnails tidak bisa diload.
5. Mekanisme pengiriman data dari input ke Flutter
Ketika user mengisi form di Flutter, data itu dikumpulkan dalam variabel, lalu diubah menjadi JSON menggunakan jsonEncode. JSON itu dikirim ke Django melalui CookieRequest atau http POST. Django menerima JSON, memvalidasi, menyimpannya ke database, lalu membalas JSON baru sebagai respons. Flutter kemudian menerima respons ini dan menampilkan perubahan tersebut di UI. Jadi kayak oper barang: Flutter kirim paket → Django proses paket → Django balas → Flutter update tampilan.
6. Mekanisme autentikasi login-register-logout
Pada login, Flutter mengirim username dan password ke endpoint Django. Django memeriksa kecocokan data dengan database, dan kalau benar, Django membuat session dan memberikan cookie ke Flutter melalui CookieRequest. CookieRequest menyimpan cookie itu sehingga setiap request berikutnya otomatis terautentikasi. Pada register, Flutter hanya mengirim data user baru, Django buat usernya, lalu Flutter bisa langsung login setelahnya. Logout bekerja dengan mengirim permintaan logout ke Django, Django menghapus session user, dan Flutter membuang cookie lokal lalu kembali ke halaman login. Semua proses ini berjalan memakai mekanisme cookie session Django, bukan token JWT.
7. Bagaimana mengimplementasikan checklist secara bertahap
Step-by-step, aku mulai dari membuat model Django dan endpoint JSON dulu supaya Flutter punya data yang bisa dibaca. Setelah itu, aku buat model Dart lewat Quicktype biar parsing JSON lebih aman. Lanjut aku konfigurasi CookieRequest di main.dart supaya satu instance dipakai di seluruh aplikasi lewat Provider. Setelah backend siap, aku bikin halaman list, card, detail, dan form yang semuanya mengambil atau mengirim data memakai CookieRequest. Lalu aku pasang proxy-image dan perbaikan ALLOWED_HOSTS, CORS, serta izin Internet Android supaya gambar dan request bisa masuk ke Django. Terakhir aku implementasi login-register-logout dengan CookieRequest, memastikan semua navigasi bekerja dari halaman ke halaman. Jadi prosesnya bukan cuma ikut tutorial, tapi benar-benar ngerangkai backend, frontend, dan konektivitasnya sampai jalan bareng.