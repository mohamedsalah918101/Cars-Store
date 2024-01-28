import 'package:cars_store/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD8qOtONA0QI1KzsZrG0NaqdgpRck4dEOU",
          authDomain: "carstore-16676.firebaseapp.com",
          projectId: "carstore-16676",
          storageBucket: "carstore-16676.appspot.com",
          messagingSenderId: "903972850603",
          appId: "1:903972850603:web:664bb4a11ca1758cae20ee",
          measurementId: "G-B18TCT8XEB")
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashScreen(),
  ));
}
