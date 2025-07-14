import 'package:flutter/material.dart';

import 'package:storeapp/screens/home_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
