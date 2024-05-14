import 'package:cars_store/controller/firestore_controller.dart';
import 'package:cars_store/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
class userAccount extends StatelessWidget {
  var userDetails = Get.arguments;
  final FirestoreController firestoreController=Get.put(FirestoreController());
  var _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromRGBO(36, 54, 101, 1.0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx((){
              return Center(
                child: Text(
                  "${firestoreController.user.value.firstName}",
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(36, 54, 101, 1.0)),
                ),
              );
            }),
            const SizedBox(
              height: 5,
            ),Obx((){
              return Center(
                child: Text(
                  "${firestoreController.user.value.lastName}",
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(36, 54, 101, 1.0)),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Obx((){
              return Card(
                color: const Color.fromRGBO(36, 54, 101, 1.0),
                child: ListTile(
                    leading: const Icon(Icons.mail, color: Colors.white,),
                  title: Text("${firestoreController.user.value.email}", style: const TextStyle(fontSize: 20, color: Colors.white),),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Obx((){
              return Card(
                color: const Color.fromRGBO(36, 54, 101, 1.0),
                child: ListTile(
                  leading: const Icon(Icons.phone, color: Colors.white,),
                  title: Text("${firestoreController.user.value.phoneNumber}",style: const TextStyle(fontSize: 20, color: Colors.white),),
                ),
              );
            }),
            const SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    Get.defaultDialog(
                        title: "Sign Out",
                        titleStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        middleText: 'Do you want to Sign Out?',
                        middleTextStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        backgroundColor: Colors.grey,
                        radius: 10,
                        textCancel: 'No',
                        cancelTextColor: Colors.black,
                        textConfirm: 'Yes',
                        confirmTextColor: Colors.white,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () async {
                          await _auth.signOut();
                          await Get.offAll(() => login());
                        },
                        buttonColor: Colors.black);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(36, 54, 101, 1.0)),
                  ),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
