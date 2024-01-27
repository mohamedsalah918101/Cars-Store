import 'package:flutter/material.dart';

class AddPost extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        title: Text("Add Your Car",
          style: TextStyle(color: Colors.white),),
      ),
    );
  }

}