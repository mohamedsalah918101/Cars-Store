import 'package:flutter/material.dart';

class favoritesCars extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Favorites",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Color.fromRGBO(36, 54, 101, 1.0)),
        ),
      ),
    );
  }

}