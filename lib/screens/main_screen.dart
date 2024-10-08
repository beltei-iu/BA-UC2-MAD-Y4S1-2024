import 'package:flutter/material.dart';
import 'package:mad3/localization/app_localization.dart';
import 'package:mad3/screens/class_screen.dart';
import 'package:mad3/screens/home_screen.dart';
import 'package:mad3/screens/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var _currentIndex = 0;
  final screenList = [
    HomeScreen(),
    ClassScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {

    final items = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: AppLocalization.of(context)!.translate(LocKey.home)),
      BottomNavigationBarItem(icon: Icon(Icons.class_outlined), label: AppLocalization.of(context)!.translate(LocKey.classroom)),
      BottomNavigationBarItem(icon: Icon(Icons.more_horiz_sharp), label: AppLocalization.of(context)!.translate(LocKey.more)),
    ];

    final buttonNavigationBar = BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onTap: (_index){
          setState(() {
            _currentIndex = _index;
          });
        },
        fixedColor: Colors.deepPurple,
        selectedFontSize: 16,
    );

    return Scaffold(
      body: screenList.elementAt(_currentIndex),
      bottomNavigationBar: buttonNavigationBar,
    );
  }
}
