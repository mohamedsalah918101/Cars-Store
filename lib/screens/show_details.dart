import 'package:cars_store/screens/favorites_cars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class ShowDetails extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(width: double.infinity, children: [
                Image.asset("assets/images/car_example.webp"),
                Image.asset("assets/images/car_example.webp"),
                Image.asset("assets/images/car_example.webp")
              ]),
              SizedBox(
                height: 20,
              ),
              Text(
                "EGP 100000",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Audi Q8",
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
                  Expanded(flex: 3, child: Text('Caro, Egypt',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),)),
                  Expanded(child: Text('23/4/2023',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
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
                        Text('Audi'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Model :')),
                        Text('Q8'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Year :')),
                        Text('2023'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Body Type :')),
                        Text('Sedan'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Cylinders :')),
                        Text('4 Cylinders'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: 150, child: Text('Engine Capacity(CC) :')),
                        Text('1800-2000'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Fuel Type :')),
                        Text('Gasoline'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: 150, child: Text('Transmission Type :')),
                        Text('Automatic'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Color :')),
                        Text('Blue'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 150, child: Text('Kilometers :')),
                        Text('90000-99999'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 150, child: Text('Description :')),
                        Expanded(
                            child: Text(
                                'My Car is Audi A8 2023 Fabrika djkkjadkjdakdakjdagkgdkagkdagkgakjgkjgjkdgdajkgkadgkdagkda')),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () async {
                                await launchUrl(Uri.parse('tel:01015305666'));
                              },
                              child: Icon(Icons.phone, color: Colors.white),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(36, 54, 101, 1.0)),
                              )),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextButton(
                              onPressed: () async {
                                await launchUrl(Uri.parse('sms:+201550918101'));
                              },
                              child: Icon(Icons.sms, color: Colors.white),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
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
      ),
    );
  }
}
