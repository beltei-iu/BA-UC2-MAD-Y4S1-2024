import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {
  @override
  _AnimationControllerDemoState createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
                width: 100.0 + 100.0 * _controller.value,
                height: 100.0 + 100.0 * _controller.value,
              child: child,
            );
          },
          child: Image.asset("assets/images/beltei_iu_logo.png"),
        ),
      ),
    );
  }
}
