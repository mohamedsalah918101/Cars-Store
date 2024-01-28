import 'package:cars_store/screens/add_car_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Color.fromRGBO(36, 54, 101, 1.0)),),
      ),
      body: Center(
        child: Text(
          "All Posted Cars!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => AddPost());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

}