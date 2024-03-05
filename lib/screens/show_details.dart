import 'package:cars_store/controller/connectivity_controller.dart';
import 'package:cars_store/controller/firestore_controller.dart';
import 'package:cars_store/models/post_model.dart';
import 'package:cars_store/screens/add_car_details.dart';
import 'package:cars_store/screens/edit_car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetails extends StatelessWidget {
  final FirestoreController firestoreController =
      Get.put(FirestoreController());
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  PostModel? post;

  ShowDetails(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          if (post?.ownerName == firestoreController.user.value.firstName! + ' ' + firestoreController.user.value.lastName!)
            IconButton(
              onPressed: () {
                Get.to(EditPost(post: post));
              },
              icon: Icon(Icons.edit, color: Colors.white,),
            )
        ],
      ),
      body: Obx(() => connectivityController.isConnected.value
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      List<String> images = [];
                      post!.images?.forEach((element) {
                        images.add(element);
                      });
                      List<Widget> widgets = [];
                      for (var image in images) {
                        widgets.add(FadeInImage(
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                            image: NetworkImage(image)));
                      }
                      return ImageSlideshow(
                          width: double.infinity, children: widgets);
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "EGP ${post!.price}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(() => firestoreController.user.value
                                .isFavourited(post?.id)
                            ? GestureDetector(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  firestoreController
                                      .addRemoveFavourites(post!.id);
                                },
                              )
                            : GestureDetector(
                                child: Icon(Icons.favorite_border),
                                onTap: () {
                                  firestoreController
                                      .addRemoveFavourites(post!.id);
                                },
                              ))
                      ],
                    ),
                    Text(
                      "${post!.brand} ${post!.model}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                              post!.location.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            )),
                        Expanded(
                            child: Text(
                                post!.time!.day.toString() +
                                    '/' +
                                    post!.time!.month.toString() +
                                    '/' +
                                    post!.time!.year.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white10,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detialis',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Brand :')),
                              Text(post!.brand.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Model :')),
                              Text(post!.model.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Year :')),
                              Text(post!.year.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Body Type :')),
                              Text(post!.bodyType.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Cylinders :')),
                              Text(post!.cylinders.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Engine Capacity(CC) :')),
                              Text(post!.engineCapacity.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Fuel Type :')),
                              Text(post!.fuelType.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Transmission Type :')),
                              Text(post!.transmissionType.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Color :')),
                              Text(post!.color.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Kilometers :')),
                              Text(post!.kilometers.toString()),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 150, child: Text('Description :')),
                              Expanded(
                                  child: Text(post!.description.toString())),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(color: Colors.black),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 150, child: Text('Car Owner :')),
                              Text(post!.ownerName.toString()),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(
                                          'tel:+2${post!.ownerMobile}'));
                                    },
                                    child:
                                        Icon(Icons.phone, color: Colors.white),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(36, 54, 101, 1.0)),
                                    )),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(
                                          'sms:+2${post!.ownerMobile}'));
                                    },
                                    child: Icon(Icons.sms, color: Colors.white),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(36, 54, 101, 1.0)),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ))),
    );
  }
}
