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
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.04;
    final fontSize = size.width * 0.04;
    final iconSize = size.width * 0.06;
    final borderRadius = size.width * 0.05;

    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  totalText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                onPressed: onAddToCart,
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: onMinus,
                    icon: Icon(Icons.remove, color: Colors.white, size: iconSize),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    width: size.width * 0.08,
                    child: Center(
                      child: Text(
                        "$quantity",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onPlus,
                    icon: Icon(Icons.add, color: Colors.white, size: iconSize),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}