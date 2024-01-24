import 'package:flutter/material.dart';

class userAccount extends StatelessWidget{
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
    );
  }

}