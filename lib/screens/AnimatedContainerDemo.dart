import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      width: _isExpanded ? 200.0 : 100.0,
      height: _isExpanded ? 200.0 : 100.0,
      color: _isExpanded ? Colors.blue : Colors.red,
      alignment: _isExpanded ? Alignment.center : AlignmentDirectional.topCenter,
      child: ElevatedButton(
          onPressed: (){
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text("Click")
      ),
    );
  }
}
