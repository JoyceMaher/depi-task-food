import 'package:flutter/foundation.dart';
import '../model/products.dart';

class DetailsController extends ChangeNotifier {
  int quantity = 1;

  String selectedSize = "";
  final Map<String, bool> selectedExtras = {};

  void initFromProduct(Product product) {
    if (product.sizes.isNotEmpty) {
      selectedSize = product.sizes.first.name;
    } else {
      selectedSize = "";
    }

    selectedExtras
      ..clear()
      ..addEntries(product.extras.map((e) => MapEntry(e.name, false)));

    quantity = 1;
    notifyListeners();
  }

  void plus() {
    quantity++;
    notifyListeners();
  }

  void minus() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  void selectSize(String size) {
    selectedSize = size;
    notifyListeners();
  }

  void toggleExtra(String name) {
    selectedExtras[name] = !(selectedExtras[name] ?? false);
    notifyListeners();
  }

  double total(Product product) {
    final sizeCost = product.sizes
        .firstWhere(
          (s) => s.name == selectedSize,
      orElse: () => const ProductSizeOption(name: "", extraPrice: 0),
    )
        .extraPrice;

    final extrasCost = product.extras
        .where((e) => selectedExtras[e.name] == true)
        .fold(0.0, (sum, e) => sum + e.price);

    return quantity * (product.priceEgp + sizeCost + extrasCost);
  }
}