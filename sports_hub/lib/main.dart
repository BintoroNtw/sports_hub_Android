import 'package:sports_hub/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sports hub',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}