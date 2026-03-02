import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => onTap(0),
              icon: Icon(
                Icons.person_outline,
                color: selectedIndex == 0 ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => onTap(1),
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: selectedIndex == 1 ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(width: 40),
            IconButton(
              onPressed: () => onTap(3),
              icon: Icon(
                Icons.favorite_border,
                color: selectedIndex == 3 ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => onTap(4),
              icon: Icon(
                Icons.home_outlined,
                color: selectedIndex == 4 ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}