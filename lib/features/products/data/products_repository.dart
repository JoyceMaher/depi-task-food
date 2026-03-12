import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/products.dart';

class ProductsRepository {
  Future<List<Product>> loadLocalProducts() async {
    final jsonString = await rootBundle.loadString('assets/data/products.json');
    final decoded = jsonDecode(jsonString);

    if (decoded is! List) {
      throw Exception("products.json must be a JSON array []");
    }

    return decoded
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Product>> loadApiProducts() async {
    final uri = Uri.parse('https://dummyjson.com/products?limit=100');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to load API products");
    }

    final decoded = jsonDecode(response.body);

    if (decoded['products'] is! List) {
      throw Exception("API response is invalid");
    }

    return (decoded['products'] as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}