import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/products.dart';

class ProductsRepository {
  Future<List<Product>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final decoded = jsonDecode(jsonString);

    if (decoded is! List) {
      throw Exception("products.json must be a JSON array []");
    }

    return decoded
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}