import 'package:flutter/material.dart';

class DetailsBottomBar extends StatelessWidget {
  final String totalText;
  final int quantity;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  final VoidCallback onAddToCart;

  const DetailsBottomBar({
    super.key,
    required this.totalText,
    required this.quantity,
    required this.onMinus,
    required this.onPlus,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                totalText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: onAddToCart,
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: onMinus,
                    icon: const Icon(Icons.remove, color: Colors.white),
                    constraints: const BoxConstraints(),
                  ),
                  Text(
                    "$quantity",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: onPlus,
                    icon: const Icon(Icons.add, color: Colors.white),
                    constraints: const BoxConstraints(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}