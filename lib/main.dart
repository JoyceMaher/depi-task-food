import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/cart': (context) => const CartPage(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}
