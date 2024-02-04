import 'package:cars_store/controller/connectivity_controller.dart';
import 'package:cars_store/controller/firestore_controller.dart';
import 'package:cars_store/models/user_model.dart';
import 'package:cars_store/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  final TextEditingController fristName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  var _auth = FirebaseAuth.instance;
  final FirestoreController firestoreController = Get.put(FirestoreController());
  final ConnectivityController connectivityController=Get.put(ConnectivityController());
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(36, 54, 101, 1.0)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: fristName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: lastName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPassword,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () async {
                    if (fristName.text.isEmpty) {
                      _showToast('Please,Enter your First Name');
                    } else if (lastName.text.isEmpty) {
                      _showToast('Please,Enter your Last Name');
                    } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email.text)) {
                      _showToast('Please,Enter a Valid E-mail');
                    }
                    if (phoneNumber.text.length != 11) {
                      _showToast('Please,Enter a Valid Phone Number');
                    } else if (password.text.length < 6) {
                      _showToast('Please,Enter a Password over 6 digits');
                    } else if (password.text != confirmPassword.text) {
                      _showToast('Please,Confirm your Password');
                    } else {
                      try {
                        await _auth.createUserWithEmailAndPassword(
                            email: email.text, password: password.text);
                        UserModel user = UserModel(id: _auth.currentUser?.uid,
                            firstName: fristName.text,
                            lastName: lastName.text,
                            phoneNumber: phoneNumber.text,
                            email: email.text,favourites: <String>[]);
                        await firestoreController.addUser(user);
                        Get.offAll(() => bottomNavigation());
                      } catch (e) {
                        _showToast('Failed to Sign Up ,Try Again');
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(36, 54, 101, 1.0)),
                  ),
                  child: Text('Sign up',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))),
              SizedBox(height: 10),
              Obx(() => connectivityController.isConnected.value ?Text(''):Text('No Internet Connection',style: TextStyle(color: Colors.red),))
            ],
          ),
        ),
      ),
    );
  }
}
