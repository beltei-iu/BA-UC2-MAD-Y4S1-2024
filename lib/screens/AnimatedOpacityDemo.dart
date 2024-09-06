import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {

  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Icon(Icons.favorite, color: Colors.red,size: 100,),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _opacity = _opacity == 1.0 ? 0.0 : 1.0;
            });
          },
          child: Text('${_opacity == 0.0 ? 'Hide' : 'Show'}'),
        ),
      ],
    );
  }
}
