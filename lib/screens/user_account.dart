import 'package:cars_store/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class userAccount extends StatelessWidget {
  var userDetails = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        title: Text(
          "Account",
          style: TextStyle(color: Colors.white),
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
                child: Icon(
                  Icons.account_circle,
                  size: 160,
                  color: Color.fromRGBO(36, 54, 101, 1.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "First Name: ${userDetails[0]}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Last Name: ${userDetails[1]}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "E-mail: ${userDetails[2]}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Phone Number: ${userDetails[3]}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => login());
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
