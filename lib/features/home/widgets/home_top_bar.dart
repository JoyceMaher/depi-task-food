import 'package:flutter/material.dart';
import 'dart:async';


class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const WiggleIcon(icon: Icons.notifications_none),
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


class WiggleIcon extends StatefulWidget {
  final IconData icon;

  const WiggleIcon({super.key, required this.icon});

  @override
  State<WiggleIcon> createState() => _WiggleIconState();
}

class _WiggleIconState extends State<WiggleIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.3, end: 0.3), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.2), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.2), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.2, end: 0.0), weight: 1),
    ]).animate(_controller);

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: child,
        );
      },
      child: Icon(widget.icon, size: 28),
    );
  }
}