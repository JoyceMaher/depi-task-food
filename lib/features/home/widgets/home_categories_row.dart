import 'package:flutter/material.dart';

class HomeCategoriesRow extends StatelessWidget {
  const HomeCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FoodCategory(title: "Meat", imagePath: "assets/meat.png"),
        _FoodCategory(title: "Seafood", imagePath: "assets/seafood.png"),
        _FoodCategory(title: "Grill", imagePath: "assets/chicken.png"),
        _FoodCategory(title: "Fast Food", imagePath: "assets/burger.png"),
      ],
    );
  }
}

class _FoodCategory extends StatelessWidget {
  final String title;
  final String imagePath;

  const _FoodCategory({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}