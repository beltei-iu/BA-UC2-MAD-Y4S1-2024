import 'package:flutter/material.dart';

class AnimatedAlignDemo extends StatefulWidget {
  @override
  _AnimatedAlignDemoState createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  // Variable to track the alignment of the child widget
  bool _isAlignedTopLeft = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: _isAlignedTopLeft ? Alignment.topLeft : Alignment.bottomRight,
      duration: Duration(seconds: 4),
      curve: Curves.easeInOut,
      child: GestureDetector(
        child: Icon(Icons.favorite,
          color: Colors.red,
          size: 100,),
        onTap: (){
          setState(() {
            _isAlignedTopLeft = !_isAlignedTopLeft;
          });
        },
      ),
    );
  }
}
