import 'package:flutter/material.dart';
import 'package:sports_hub/screens/product_entry_list.dart';
import 'package:flutter/material.dart';
import 'package:sports_hub/screens/productList_form.dart';
import 'package:sports_hub/screens/product_entry_list.dart';
import 'package:sports_hub/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sports_hub/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      // Menggunakan warna dari objek item
      color: item.color,
      // Membuat sudut kartu melengkung
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi saat kartu ditekan
        onTap: () async {
          // SnackBar
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );

          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage()),
            );
          }

          else if (item.name == "All Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
            );
          }
          else if (item.name == "My Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
            );
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
              "http://localhost:8000/auth/logout/",
            );
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$message See you again, $uname.")),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            }
          }
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