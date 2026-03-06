import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  final String? title;
  final bool lightIcons;

  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  const AppTopBar({
    super.key,
    this.title,
    this.lightIcons = false,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = lightIcons ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onLeftPressed,
            icon: Icon(Icons.notifications, size: 28, color: iconColor),
          ),
          if (title != null)
            Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            )
          else
            const SizedBox(width: 1),
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_outlined, color: Colors.white),
              onPressed: onRightPressed ?? () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}