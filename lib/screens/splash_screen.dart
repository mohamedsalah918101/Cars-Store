import 'package:cars_store/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';

class splashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splashIconSize: 200,
          splashTransition: SplashTransition.scaleTransition,
          splash: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/car_logo.png"),
            backgroundColor: Colors.white,
          ),
          nextScreen: login()
      ),
    );
  }

}