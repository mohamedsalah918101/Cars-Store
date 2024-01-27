import 'package:flutter/material.dart';

class favoritesCars extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        title: Text(
            "Favorites",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}