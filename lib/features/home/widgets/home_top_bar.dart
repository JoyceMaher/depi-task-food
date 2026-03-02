import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.notifications_none, size: 28),
        const Spacer(),
        Column(
          children: const [
            Text(
              "Current Location",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              "19 Sheikh Ahmed El-Sawy, Nasr City",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 21,
          backgroundImage: AssetImage("assets/avatar.png"),
        ),
      ],
    );
  }
}