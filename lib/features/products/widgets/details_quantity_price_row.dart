import 'package:flutter/material.dart';

class DetailsQuantityPriceRow extends StatelessWidget {
  final int quantity;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  final String priceText;

  const DetailsQuantityPriceRow({
    super.key,
    required this.quantity,
    required this.onMinus,
    required this.onPlus,
    required this.priceText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.orange),
                onPressed: onMinus,
                constraints: const BoxConstraints(),
              ),
              Text(
                "$quantity",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.orange),
                onPressed: onPlus,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        Text(
          priceText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}