import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/view/home_view.dart';
import 'features/cart/view/cart_view.dart';
import 'features/products/view/products_view.dart';

import 'features/cart/controller/cart_bloc.dart';
import 'features/favorites/controller/favorites_cubit.dart';
import 'features/favorites/data/favorites_repository.dart';
import 'features/favorites/view/favorites_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartBloc(),
        ),
        BlocProvider(
          create: (_) => FavoritesCubit(FavoritesRepository())..load(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food App",
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/cart': (context) => const CartPage(),
          '/details': (context) => const DetailsScreen(),
          '/favorites': (context) => const FavoritesView(),
        },
      ),
    );
  }
}