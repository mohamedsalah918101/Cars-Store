import 'package:cars_store/screens/add_car_details.dart';
import 'package:cars_store/screens/show_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatelessWidget{
  final List<int> favoriteCars = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Color.fromRGBO(36, 54, 101, 1.0)),),

      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index){
            return  Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    "assets/images/car_example.webp",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Ferrari ${index}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                ),
                subtitle: Align(
                    alignment: Alignment.centerRight,
                    child: Text("\$10,000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                onTap: (){
                  Get.to(() => ShowDetails(index));
                },
              ),
            );
          }
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