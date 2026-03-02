import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/cart/controller/cart_bloc.dart';
import 'features/home/view/home_view.dart';
import 'features/cart/view/cart_view.dart';
import 'features/products/view/products_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food App",
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/cart': (context) => const CartPage(),
          '/details': (context) => const DetailsScreen(),
        },
      ),
    );
  }
}