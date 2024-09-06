import 'package:flutter/material.dart';

class CurvedAnimationDemo extends StatefulWidget {

  const CurvedAnimationDemo({super.key});

  @override
  State<CurvedAnimationDemo> createState() => _CurvedAnimationDemoState();
}

class _CurvedAnimationDemoState extends State<CurvedAnimationDemo> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 50, end: 300).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut) as Animation<double>,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: AnimatedBuilder(
      animation: _animation,
        builder: (context, child) {
          return Container(
            width: _animation.value,
            height: 100,
            color: Colors.blue,
          );
        }
    ),
    );
  }
}
