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
            return  GestureDetector(
              onTap: (){
                Get.to(() => ShowDetails(index));
              },
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/car_example.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      title: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Ferrari ${index}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("\$10,000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Cairo, Egypt", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("2 days ago", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey)))
                        ],
                      ),
                    ),
                  ],
                ),
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