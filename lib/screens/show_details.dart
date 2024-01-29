import 'package:cars_store/screens/favorites_cars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ShowDetails extends StatelessWidget{
  int? carIndex;
  ShowDetails(this.carIndex);
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      textColor: Colors.white,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/car_example.webp"),
            SizedBox(height: 20,),
            Text("Ferrari ${carIndex}",style: TextStyle(fontSize: 30),),
            SizedBox(height: 15,),
            Text("\$10,000",style: TextStyle(fontSize: 25),),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: ()  {
                  _showToast("Added to Favorites");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(36, 54, 101, 1.0)),
                ),
                child: Text(
                  "Add to Favorites",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }

}