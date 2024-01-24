import 'package:cars_store/screens/home.dart';
import 'package:cars_store/screens/sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget{
  @override
  State<login> createState() {
    return loginState();
  }

}
class loginState extends State<login>{
  String email = "";
  String password = "";
  var _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.red
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                email = value;
              },
              decoration: InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value){
                password = value;
              },
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                  )
              ),
              obscureText: true,
            ),
            SizedBox(height: 40,),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      if (emailController.text.isNotEmpty &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text) &&
                          passwordController.text.isNotEmpty) {

                        await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        if(_auth.currentUser != null){
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString("email", _auth.currentUser!.email.toString());

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                          );
                        }
                      } else {
                        _showToast("Please enter E-mail and Password");
                      }

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        _showToast('User does not exist. Please sign up.');
                      } else if (e.code == 'wrong-password') {
                        _showToast('Incorrect password. Please try again.');
                      } else {
                        _showToast("User does not exist or Wrong password.");
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Do not have an account? Please",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp(),
                      ));
                },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}