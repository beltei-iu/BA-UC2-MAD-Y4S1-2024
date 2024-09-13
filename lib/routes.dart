
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad3/screens/home_screen.dart';
import 'package:mad3/screens/language_screen.dart';
import 'package:mad3/screens/main_screen.dart';
import 'package:mad3/screens/splash_screen.dart';

class RouteGenerator {

  static const String splashPage = "/";
  static const String homePage = "/home";
  static const String languagePage = "/language";

  RouteGenerator._(){}

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> routeGenerate(RouteSettings settings){

    switch(settings.name){
      case splashPage:
        final route = MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
        return route;
      case homePage:
        final route = MaterialPageRoute(builder: (BuildContext context) => MainScreen());
        return route;
      case languagePage:
        final route = MaterialPageRoute(builder: (BuildContext context) => LanguageScreen());
        return route;
      default :
        throw RouteException("Route not found");
    }
  }
}

class RouteException implements Exception {

  String message;

  RouteException(this.message);

}