import 'package:flutter/material.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  @override
  _AnimatedPositionedDemoState createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {

  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedPositioned(
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          left: _isMoved ? 200.0 : 20.0,
          top: _isMoved ? 200.0 : 20.0,
          child: GestureDetector(
            child: Icon(Icons.favorite, color: Colors.red,size: 100,),
            onTap: (){
              setState(() {
                _isMoved = !_isMoved;
              });
            },),
        ),
      ],
    );
  }
}
