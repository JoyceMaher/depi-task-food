import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String badgeText;

  const SectionHeader({
    super.key,
    required this.title,
    required this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          badgeText,
          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}