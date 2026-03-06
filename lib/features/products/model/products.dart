class ProductSizeOption {
  final String name;
  final double extraPrice;

  const ProductSizeOption({
    required this.name,
    required this.extraPrice,
  });

  factory ProductSizeOption.fromJson(Map<String, dynamic> json) {
    return ProductSizeOption(
      name: json['name'] as String,
      extraPrice: (json['extraPrice'] as num).toDouble(),
    );
  }
}

class ProductExtraOption {
  final String name;
  final double price;

  const ProductExtraOption({
    required this.name,
    required this.price,
  });

  factory ProductExtraOption.fromJson(Map<String, dynamic> json) {
    return ProductExtraOption(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
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
        .map((e) => ProductSizeOption.fromJson(e as Map<String, dynamic>))
        .toList();

    final extrasJson = (json['extras'] as List<dynamic>? ?? const [])
        .map((e) => ProductExtraOption.fromJson(e as Map<String, dynamic>))
        .toList();

    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      priceEgp: (json['priceEgp'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      sizes: sizesJson,
      extras: extrasJson,
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

  factory Product.fromMap(Map<String, dynamic> map) => Product(
    id: map["id"] as String,
    title: map["title"] as String,
    category: map["category"] as String,
    priceEgp: (map["priceEgp"] as num).toDouble(),
    rating: (map["rating"] as num).toDouble(),
    reviewsCount: (map["reviewsCount"] as num).toInt(),
    imagePath: map["imagePath"] as String,
    description: map["description"] as String,
    sizes: const [],
    extras: const [],
  );
}