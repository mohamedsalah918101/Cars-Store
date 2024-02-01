import 'package:cars_store/controller/firestore_controller.dart';
import 'package:cars_store/screens/add_car_details.dart';
import 'package:cars_store/screens/show_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class home extends StatelessWidget{
  final FirestoreController firestoreController=Get.put(FirestoreController());
  List<PostModel>? posts;
  @override
  Widget build(BuildContext context) {
    firestoreController.getPosts();
    print('Posts:${firestoreController.posts.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Color.fromRGBO(36, 54, 101, 1.0)),),

      ),
      body:  SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Posts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
           Obx(() => ListView.builder(
              shrinkWrap: true,
              physics:NeverScrollableScrollPhysics() ,
              itemCount: firestoreController.posts.length,
                itemBuilder: (context, index){
                  return  GestureDetector(
                    onTap: (){
                      Get.to(() => ShowDetails(firestoreController.posts[index]));
                    },
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              firestoreController.posts[index].images![0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            title: Align(
                                alignment: Alignment.topLeft,
                                child: Text('${firestoreController.posts[index].brand} ${firestoreController.posts[index].model} ${firestoreController.posts[index].year}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("EGP ${firestoreController.posts[index].price}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(firestoreController.posts[index].location.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('${firestoreController.posts[index].time!.day}/${firestoreController.posts[index].time!.month}/${firestoreController.posts[index].time!.year}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey)))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            )),
          ],
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