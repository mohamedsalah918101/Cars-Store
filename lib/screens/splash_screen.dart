import 'package:cars_store/screens/bottom_navigation.dart';
import 'package:cars_store/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splashScreen extends StatelessWidget{
  var _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splashIconSize: 200,
          splashTransition: SplashTransition.scaleTransition,
          splash: Image.asset("assets/images/blue.jpg"),
          nextScreen: _auth.currentUser==null? login():bottomNavigation()
      ),
    );
  }

}