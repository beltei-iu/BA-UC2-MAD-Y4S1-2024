import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mad3/localization/app_localization.dart';
import 'package:mad3/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 10), () => {
    //   Navigator.pushReplacementNamed(context, RouteGenerator.homePage)
    
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/beltei_iu_logo.png", width: 100,),
              ) 
            ),
            ElevatedButton(onPressed: (){
              //  Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
              RouteGenerator.key.currentState?.pushReplacementNamed(RouteGenerator.homePage);
            }, child: Text(AppLocalization.of(context)!.translate(LocKey.getStart))),
            SizedBox(height: 20,)
          ],
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     child: ElevatedButton(onPressed: (){}, child: Text("Get Start")),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
