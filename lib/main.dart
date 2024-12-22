import 'package:cars_store/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "carstore",
      options: const FirebaseOptions(
          apiKey: "AIzaSyD8yrikgobvCk4K9DsCymahjnep3jn-G3Y",
          authDomain: "carstore-16676.firebaseapp.com",
          projectId: "carstore-16676",
          storageBucket: "carstore-16676.appspot.com",
          messagingSenderId: "903972850603",
          appId: "1:903972850603:android:a68feeb525f075a0ae20ee",
          measurementId: "G-B18TCT8XEB")
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashScreen(),
  ));
}
