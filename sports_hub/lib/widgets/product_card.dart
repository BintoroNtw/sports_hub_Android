import 'package:flutter/material.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;
  final Widget? targetPage; // Tambahkan parameter untuk halaman tujuan

  const ItemCard(this.item, {super.key, this.targetPage});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menggunakan warna dari objek item
      color: item.color,
      // Membuat sudut kartu melengkung
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi saat kartu ditekan
        onTap: () {
          // Memunculkan SnackBar sesuai nama tombol
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );

          // === TAMBAHAN KODE NAVIGASI ===
          // Cek jika ada halaman tujuan (targetPage) yang diberikan
          if (targetPage != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => targetPage!,
              ),
            );
          }
          // === AKHIR TAMBAHAN KODE NAVIGASI ===
        },
        // Container untuk menyimpan icon dan text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun icon dan text menjadi di tengah kartu
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}