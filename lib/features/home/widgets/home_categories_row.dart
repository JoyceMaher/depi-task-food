import 'package:flutter/material.dart';
import '../../products/view/category_products_view.dart';

class HomeCategoriesRow extends StatelessWidget {
  const HomeCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        JumpBounce(
          delay: 50,
          child: _FoodCategory(
            title: "Meat",
            imagePath: "assets/meat.png",
            apiCategory: "smartphones",
          ),
        ),
        JumpBounce(
          delay: 100,
          child: _FoodCategory(
            title: "Seafood",
            imagePath: "assets/seafood.png",
            apiCategory: "laptops",
          ),
        ),
        JumpBounce(
          delay: 150,
          child: _FoodCategory(
            title: "Grill",
            imagePath: "assets/chicken.png",
            apiCategory: "fragrances",
          ),
        ),
        JumpBounce(
          delay: 200,
          child: _FoodCategory(
            title: "Fast Food",
            imagePath: "assets/burger.png",
            apiCategory: "groceries",
          ),
        ),
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

class JumpBounce extends StatefulWidget {
  final Widget child;
  final int delay;

  const JumpBounce({
    super.key,
    required this.child,
    this.delay = 0,
  });

  @override
  State<JumpBounce> createState() => _JumpBounceState();
}

class _JumpBounceState extends State<JumpBounce> {
  double offsetY = 0;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() async {
    await Future.delayed(Duration(milliseconds: widget.delay));
    while (mounted) {
      setState(() => offsetY = -10);
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() => offsetY = 0);
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0, offsetY, 0),
      child: widget.child,
    );
  }
}