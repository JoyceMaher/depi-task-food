import 'package:flutter/material.dart';

class BestTodayHeader extends StatelessWidget {
  const BestTodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("🔥", style: TextStyle(fontSize: 22)),
        SizedBox(width: 8),
        Text(
          "Best of the Day",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}