import 'package:cars_store/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

String email = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((value){
    email = value.getString("email").toString();
    return runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: splashScreen(),
        )
    );
  });

}
