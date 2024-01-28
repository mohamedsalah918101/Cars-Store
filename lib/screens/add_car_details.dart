import 'package:flutter/material.dart';

class AddPost extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Car",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(36, 54, 101, 1.0)),),
      ),
    );
  }

}