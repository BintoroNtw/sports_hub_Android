import 'package:flutter/material.dart';
import 'package:sports_hub/models/product_entry.dart';
import 'package:sports_hub/widgets/left_drawer.dart';
import 'package:sports_hub/screens/product_detail.dart';
import 'package:sports_hub/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool filterByUser;
  const ProductEntryListPage({super.key,this.filterByUser=false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {

    final response = await request.get('http://localhost:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to product Entry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final username = request.jsonData["username"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child:
                  Text(
                    'There are no product in sports hub yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
              );
            } else {
              List<ProductEntry> products = snapshot.data!;
              if (widget.filterByUser) {
                products = products.where((p) => p.userId == username).toList();
              }
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: products[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}