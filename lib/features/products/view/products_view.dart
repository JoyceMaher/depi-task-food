import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/controller/cart_bloc.dart';
import '../../cart/controller/cart_event.dart';
import '../../../shared_widgets/section_header.dart';
import '../../../shared_widgets/option_tile.dart';
import '../controller/details_controller.dart';
import '../model/products.dart';
import '../widgets/details_bottom_bar.dart';
import '../widgets/details_quantity_price_row.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final DetailsController controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    controller = DetailsController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is! Product) {
      return const Scaffold(
        body: Center(child: Text("No product data received.")),
      );
    }

    final product = args;

    // ✅ init only once
    if (!_initialized) {
      _initialized = true;
      controller.initFromProduct(product);
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final total = controller.total(product);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image + buttons
                      Stack(
                        children: [
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 16,
                            child: IconButton(
                              icon: const Icon(Icons.notifications, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 16,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Title + description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description,
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Qty + price
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DetailsQuantityPriceRow(
                          quantity: controller.quantity,
                          onMinus: controller.minus,
                          onPlus: controller.plus,
                          priceText: "${total.toStringAsFixed(2)} EGP",
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Size
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SectionHeader(title: "Size", badgeText: "Required"),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: product.sizes.map((s) {
                            final selected = controller.selectedSize == s.name;

                            return OptionTile(
                              title: s.name,
                              selected: selected,
                              trailingText: "+${s.extraPrice.toStringAsFixed(2)} EGP",
                              onTap: () => controller.selectSize(s.name),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Extras
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SectionHeader(title: "Extras", badgeText: "Optional"),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: product.extras.map((e) {
                            final selected = controller.selectedExtras[e.name] ?? false;

                            return OptionTile(
                              title: e.name,
                              selected: selected,
                              trailingText: "+${e.price.toStringAsFixed(2)} EGP",
                              onTap: () => controller.toggleExtra(e.name),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),

                // Bottom bar
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DetailsBottomBar(
                    totalText: "${total.toStringAsFixed(2)} EGP",
                    quantity: controller.quantity,
                    onMinus: controller.minus,
                    onPlus: controller.plus,
                    onAddToCart: () {
                      context.read<CartBloc>().add(CartAddQuantity(controller.quantity));
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}