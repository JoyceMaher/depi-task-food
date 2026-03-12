
class ProductSizeOption {
  final String name;
  final double extraPrice;

  const ProductSizeOption({
    required this.name,
    required this.extraPrice,
  });
}

class ProductExtraOption {
  final String name;
  final double price;

  const ProductExtraOption({
    required this.name,
    required this.price,
  });
}

class Product {
  final String id;
  final String title;
  final String category;
  final double priceEgp;
  final double rating;
  final int reviewsCount;
  final String imagePath;
  final String description;
  final List<ProductSizeOption> sizes;
  final List<ProductExtraOption> extras;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.priceEgp,
    required this.rating,
    required this.reviewsCount,
    required this.imagePath,
    required this.description,
    required this.sizes,
    required this.extras,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final sizesJson = (json['sizes'] as List<dynamic>? ?? const [])
        .map((e) => ProductSizeOption(
      name: e['name'] as String,
      extraPrice: (e['extraPrice'] as num).toDouble(),
    ))
        .toList();

    final extrasJson = (json['extras'] as List<dynamic>? ?? const [])
        .map((e) => ProductExtraOption(
      name: e['name'] as String,
      price: (e['price'] as num).toDouble(),
    ))
        .toList();

    return Product(
      id: json['id'].toString(),
      title: json['title'] as String,
      category: json['category'] as String,
      priceEgp: (json['priceEgp'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as int?) ?? 0,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      sizes: sizesJson,
      extras: extrasJson,
    );
  }

  factory Product.fromApiJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'] as String,
      category: json['category'] as String,
      priceEgp: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: (json['stock'] as int?) ?? 0, // using stock as reviewsCount
      imagePath: json['thumbnail'] as String,
      description: json['description'] as String? ?? '',
      sizes: const [],
      extras: const [],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "category": category,
    "priceEgp": priceEgp,
    "rating": rating,
    "reviewsCount": reviewsCount,
    "imagePath": imagePath,
    "description": description,
  };
}