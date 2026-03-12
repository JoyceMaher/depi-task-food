import 'package:flutter/material.dart';
import '../../products/view/category_products_view.dart';

class HomeCategoriesRow extends StatelessWidget {
  const HomeCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _FoodCategory(title: "Meat", imagePath: "assets/meat.png", apiCategory: "smartphones"),
        _FoodCategory(title: "Seafood", imagePath: "assets/seafood.png", apiCategory: "laptops"),
        _FoodCategory(title: "Grill", imagePath: "assets/chicken.png", apiCategory: "fragrances"),
        _FoodCategory(title: "Fast Food", imagePath: "assets/burger.png", apiCategory: "groceries"),
      ],
    );
  }
}

class _FoodCategory extends StatelessWidget {
  final String title;
  final String imagePath;
  final String apiCategory;

  const _FoodCategory({
    required this.title,
    required this.imagePath,
    required this.apiCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryProductsView(category: apiCategory),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 76,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}