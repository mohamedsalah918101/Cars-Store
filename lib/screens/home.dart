import 'package:flutter/material.dart';

class home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        title: Text("Home Page",
        style: TextStyle(color: Colors.white),),
      ),
    );
  }

}