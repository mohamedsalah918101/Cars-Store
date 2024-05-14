import 'package:cars_store/controller/connectivity_controller.dart';
import 'package:cars_store/controller/firestore_controller.dart';
import 'package:cars_store/screens/bottom_navigation.dart';
import 'package:cars_store/screens/sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirestoreController firestoreController =
      Get.put(FirestoreController());
  final ConnectivityController connectivityController=Get.put(ConnectivityController());
  var _auth = FirebaseAuth.instance;

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(36, 54, 101, 1.0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<FirestoreController>(
                builder: (_) {
                  return TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: (){
                            firestoreController.visibility();
                          },
                          icon: firestoreController.isVisibility ? const Icon(Icons.visibility_off, color:  Colors.black ,) : const Icon(Icons.visibility, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromRGBO(36, 54, 101, 1.0)))),
                    obscureText: firestoreController.isVisibility ? false : true,
                  );
                }
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailController.text) &&
                          passwordController.text.isNotEmpty) {
                        try {
                          await _auth.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                        } catch (e) {
                          _showToast('Wrong Email and Password');
                        }
                        if (_auth.currentUser != null) {
                          Get.offAll(() => bottomNavigation());
                        }
                      } else {
                        _showToast("Please enter E-mail and Password");
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(36, 54, 101, 1.0)),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Do not have an account?",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => SignUp());
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(36, 54, 101, 1.0),
                            decorationThickness: 2,
                            color: Color.fromRGBO(36, 54, 101, 1.0),
                            fontSize: 20),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => connectivityController.isConnected.value ?const Text(''):const Center(child: Text('No Internet Connection',style: TextStyle(color: Colors.red),)))
            ],
          ),
        ),
      ),
    );
  }
}
