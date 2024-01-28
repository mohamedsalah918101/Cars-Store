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
    firestoreController.getUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx((){
              return Center(
                child: Text(
                  "${firestoreController.user.value.firstName}",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(36, 54, 101, 1.0)),
                ),
              );
            }),
            SizedBox(
              height: 5,
            ),Obx((){
              return Center(
                child: Text(
                  "${firestoreController.user.value.lastName}",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(36, 54, 101, 1.0)),
                ),
              );
            })
            ,
            SizedBox(
              height: 20,
            ),
            Obx((){
              return Card(
                color: Color.fromRGBO(36, 54, 101, 1.0),
                child: ListTile(
                    leading: Icon(Icons.mail, color: Colors.white,),
                  title: Text("${firestoreController.user.value.email}", style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Obx((){
              return Card(
                color: Color.fromRGBO(36, 54, 101, 1.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.white,),
                  title: Text("${firestoreController.user.value.phoneNumber}",style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              );
            }),
            SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    await _auth.signOut();
                    await Get.offAll(() => login());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(36, 54, 101, 1.0)),
                  ),
                  child: Text(
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
