import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/main_pic.png",
        width: double.infinity,
        height: 190,
        fit: BoxFit.cover,
      ),
    );
  }
}