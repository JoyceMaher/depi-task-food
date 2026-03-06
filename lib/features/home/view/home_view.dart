import 'package:flutter/material.dart';

import '../../cart/view/cart_view.dart';
import '../../favorites/view/favorites_view.dart';
import '../../products/data/products_repository.dart';
import '../../products/model/products.dart';

import '../widgets/best_header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/food_item_card.dart';
import '../widgets/hero_banner.dart';
import '../widgets/home_categories_row.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const _PlaceholderPage(title: "Profile"),
      const CartPage(),
      const _PlaceholderPage(title: "Quick Cart"),
      FavoritesView(),
      const HomePageContent(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2),
        backgroundColor: Colors.orange,
        elevation: 2,
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  late final Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductsRepository().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Failed to load products.\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        final products = snapshot.data ?? const <Product>[];
        if (products.isEmpty) {
          return const Center(child: Text("No products found."));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const SizedBox(height: 18),
              const HomeSearchBar(),
              const SizedBox(height: 22),
              const HomeCategoriesRow(),
              const SizedBox(height: 24),
              const HeroBanner(),
              const SizedBox(height: 22),
              const BestTodayHeader(),
              const SizedBox(height: 14),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) {
                  return FoodItemCard(product: products[index]);
                },
              ),
              const SizedBox(height: 18),
            ],
          ),
        );
      },
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}