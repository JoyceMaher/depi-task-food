import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/controller/cart_bloc.dart';
import '../../cart/controller/cart_event.dart';
import '../../../shared_widgets/app_top_bar.dart';
import '../../../shared_widgets/option_tile.dart';
import '../../../shared_widgets/section_header.dart';
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
  Product? _product;
  bool _didInit = false;

  @override
  void initState() {
    super.initState();
    controller = DetailsController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInit) return;
    _didInit = true;

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Product) {
      _product = args;
      controller.initFromProduct(args);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = _product;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (product == null) {
      return const Scaffold(
        body: Center(child: Text("No product data received.")),
      );
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
                  padding: EdgeInsets.only(bottom: screenHeight * 0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.35,
                            width: double.infinity,
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.03,
                            top: screenHeight * 0.02,
                            child: AppTopBar(
                              title: "",
                              lightIcons: true,
                              onLeftPressed: () {},
                              onRightPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Text(
                              product.description,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: DetailsQuantityPriceRow(
                          quantity: controller.quantity,
                          onMinus: controller.minus,
                          onPlus: controller.plus,
                          priceText: "${total.toStringAsFixed(2)} EGP",
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: SectionHeader(title: "Size", badgeText: "Required"),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Column(
                          children: product.sizes.map((s) {
                            final selected = controller.selectedSize == s.name;
                            return OptionTile(
                              title: s.name,
                              trailingText: "+${s.extraPrice.toStringAsFixed(2)} EGP",
                              selected: selected,
                              onTap: () => controller.selectSize(s.name),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: SectionHeader(title: "Extras", badgeText: "Optional"),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Column(
                          children: product.extras.map((e) {
                            final selected = controller.selectedExtras[e.name] ?? false;
                            return OptionTile(
                              title: e.name,
                              trailingText: "+${e.price.toStringAsFixed(2)} EGP",
                              selected: selected,
                              onTap: () => controller.toggleExtra(e.name),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.12),
                    ],
                  ),
                ),

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
                      context.read<CartBloc>().add(
                        CartAddQuantity(controller.quantity),
                      );
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