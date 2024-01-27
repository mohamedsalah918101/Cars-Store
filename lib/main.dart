import 'package:cars_store/screens/bottom_navigation.dart';
import 'package:cars_store/screens/sign_up.dart';
import 'package:cars_store/screens/splash_screen.dart';
import 'package:cars_store/screens/user_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()  {
   runApp(
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: splashScreen(),
        )
    );
}
