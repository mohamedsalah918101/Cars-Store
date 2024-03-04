
import 'package:flutter/material.dart';

import '../controller/connectivity_controller.dart';
import '../controller/firestore_controller.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import '../controller/image_picker_controller.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';
import 'bottom_navigation.dart';

class EditPost extends StatelessWidget {
  final TextEditingController model = TextEditingController();
  final TextEditingController color = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();

  final FirestoreController firestoreController =
      Get.put(FirestoreController());
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  final controller = Get.put(ImagePickerController());

  List<String> _bodyTypeItems = [
    '4x4',
    'Cabriolet',
    'Coupe',
    'Hatchback',
    'Other',
    'Pickup',
    'SUV',
    'Sedan',
    'Van/Bus'
  ];
  List<String> _brandItems = [
    'Alfa Romeo',
    'Aston Martin',
    'Audi',
    'BMW',
    'BYD',
    'Baic',
    'Bentley',
    'Bestune',
    'Brilliance',
    'Bugatti',
    'Buick',
    'Cadillac',
    'Chana',
    'Changan',
    'Changhe',
    'Chery',
    'Chevrolet',
    'Chrysler',
    'Citroen',
    'Classic',
    'Cupra',
    'DFSK',
    'Daewoo',
    'Daihatsu',
    'Dodge',
    'Faw',
    'Ferrari',
    'Fiat',
    'Ford',
    'GMC',
    'Geely',
    'Great Wall',
    'Haval',
    'Honda',
    'Hummer',
    'Hyundai',
    'Infiniti',
    'Isuzu',
    'Jac',
    'Jaguar',
    'Jeep',
    'Jetour',
    'KYC',
    'Kia',
    'King Long',
    'Lada',
    'Lamborghini',
    'Lancia',
    'Land Rover',
    'Lexus',
    'Lifan',
    'Lincoln',
    'Louts',
    'MG',
    'MINI',
    'Maserati',
    'Mazda',
    'McLaren',
    'Mercedes-Benz',
    'Mitsubishi',
    'Nissan',
    'Opel',
    'Other maker',
    'Peugeot',
    'Porsche',
    'Proton',
    'Renault',
    'Rolls Royce',
    'Saipa',
    'Seat',
    'Senova',
    'Skoda',
    'Soueast',
    'Speranza',
    'Ssang Yong',
    'Subaru',
    'Suzuki',
    'Tesla',
    'Toyota',
    'Volkswagen',
    'Volvo',
    'Zotye'
  ];
  List<String> _locationItems = [
    'Alexandria, Egypt',
    'Aswan, Egypt',
    'Asyut, Egypt',
    'Beheira, Egypt',
    'Beni Suef, Egypt',
    'Cairo, Egypt',
    'Dakahlia, Egypt',
    'Damietta, Egypt',
    'Fayoum, Egypt',
    'Gharbia, Egypt',
    'Giza, Egypt',
    'Ismaillia, Egypt',
    'Kafr El-Sheikh, Egypt',
    'Luxor, Egypt',
    'Matruh, Egypt',
    'Minya, Egypt',
    'Monufia, Egypt',
    'New Valley, Egypt',
    'North Sinai,Egypt',
    'Port Said, Egypt',
    'Qalyubia, Egypt',
    'Qena, Egypt',
    'Red Sea, Egypt',
    'Sharqia, Egypt',
    'Sohag, Egypt',
    'South Sinai, Egypt',
    'Suez, Egypt'
  ];
  List<String> _engineCapcityItems = [
    '0-800',
    '1000-1300',
    '1400-1500',
    '1600',
    '1800-2000',
    '2200-2800',
    'More Than 3000'
  ];
  List<String> _fuelTypeItems = [
    'Gasoline',
    'Diesel',
    'Electric',
    'Natural Gas',
    'Hybird'
  ];
  List<String> _transmissionTypeItems = ['Manual', 'Automatic'];
  List<String> _kilometersItems = [
    '0 to 9999',
    '10000 to 19999',
    '20000 to 29999',
    '30000 to 39999',
    '40000 to 49999',
    '50000 to 59999',
    '60000 to 69999',
    '70000 to 79999',
    '80000 to 89999',
    '90000 to 99999',
    '100000 to 119999',
    '120000 to 139999',
    '140000 to 159999',
    '160000 to 179999',
    '180000 to 199999',
    'More than 200000'
  ];
  List<String> _cylindersItems = [
    '3 Cylinders',
    '4 Cylinders',
    '6 Cylinders',
    '8 Cylinders',
    '10 Cylinders',
    '12 Cylinders'
  ];
  String? year;
  String? cylinders;
  String? engineCapcity;
  String? fuelType;
  String? transmissionType;
  String? kilometers;
  String? location;
  String? brand;
  String? bodyType;
  SnackbarController? snackbarController;

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

  final PostModel? post;

  EditPost({Key? key, this.post}) : super(key: key) {
    if (post != null) {
      brand = post!.brand ?? '';
      model.text = post!.model ?? '';
      year = post!.year ?? '';
      bodyType = post!.bodyType ?? '';
      cylinders = post!.cylinders ?? '';
      engineCapcity = post!.engineCapacity ?? '';
      fuelType = post!.fuelType ?? '';
      color.text = post!.color ?? '';
      transmissionType = post!.transmissionType ?? '';
      kilometers = post!.kilometers ?? '';
      price.text = post!.price ?? '';
      location = post!.location ?? '';
      description.text = post!.description ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
          title: Text(
            "Edit or Delete Post",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Delete Post",
                    titleStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    middleText: 'Do you want to Delete this post?',
                    middleTextStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: 'No',
                    cancelTextColor: Colors.black,
                    textConfirm: 'Yes',
                    confirmTextColor: Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      if (post != null) {
                        firestoreController.deletePost(post!.id!);
                        Get.offAll(() => bottomNavigation());
                      }
                    },
                    buttonColor: Colors.black);
                // Perform delete operation

              },
              icon: Icon(Icons.delete, color: Colors.white,),
            )
          ],
          centerTitle: true,
        ),
        body: Obx(
          () => connectivityController.isConnected.value
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Brand",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _brandItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                brand = value;
                              }
                              print(brand);
                            }),
                        SizedBox(height: 20),
                        TextField(
                          controller: model,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Model",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(36, 54, 101, 1.0)),
                              )),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Body Type",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _bodyTypeItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                bodyType = value;
                              }
                              print(bodyType);
                            }),
                        SizedBox(height: 20),
                        DropdownDatePicker(
                          showDay: false,
                          showMonth: false,
                          onChangedYear: (value) {
                            year = value;
                          },
                          inputDecoration: InputDecoration(
                              labelText: "Year",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(36, 54, 101, 1.0)),
                              )),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Number of Cylinders",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _cylindersItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                cylinders = value;
                              }
                              print(cylinders);
                            }),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Engine Capacity (CC)",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _engineCapcityItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                engineCapcity = value;
                              }
                              print(engineCapcity);
                            }),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Fuel Type",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _fuelTypeItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                fuelType = value;
                              }
                              print(fuelType);
                            }),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Transmission Type",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _transmissionTypeItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                transmissionType = value;
                              }
                              print(transmissionType);
                            }),
                        SizedBox(height: 20),
                        TextField(
                          controller: color,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Color",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(36, 54, 101, 1.0)),
                              )),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Kilometers",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _kilometersItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                kilometers = value;
                              }
                              print(kilometers);
                            }),
                        SizedBox(height: 20),
                        TextField(
                          controller: price,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Price",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(36, 54, 101, 1.0)),
                              )),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                labelText: "Location",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(36, 54, 101, 1.0)),
                                )),
                            items: _locationItems.map((String num) {
                              return DropdownMenuItem<String>(
                                  value: num, child: Text(num));
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                location = value;
                              }
                              print(location);
                            }),
                        SizedBox(height: 20),
                        TextField(
                          maxLines: 3,
                          controller: description,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(36, 54, 101, 1.0)),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            controller.pickImages();
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.photo,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Add Car Photos",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(() => Container(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.images.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  36, 54, 101, 1.0),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.file(
                                              controller.images[index],
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ));
                                  }),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (brand == null) {
                                _showToast('Please,Enter your Car Brand');
                              } else if (model.text.isEmpty) {
                                _showToast('Please, Enter your Car Model');
                              } else if (bodyType == null) {
                                _showToast('Please, Enter your Car Body Type');
                              } else if (year == null) {
                                _showToast('Please, Enter your Car Model Year');
                              } else if (cylinders == null) {
                                _showToast(
                                    'Please, Enter your Car number of Cylinders');
                              } else if (engineCapcity == null) {
                                _showToast(
                                    'Please, Enter your Car Engine Capacity');
                              } else if (fuelType == null) {
                                _showToast('Please, Enter your Car Fuel Type');
                              } else if (transmissionType == null) {
                                _showToast(
                                    'Please, Enter your Car Transmission Type');
                              } else if (color.text.isEmpty) {
                                _showToast('Please, Enter your Car Color');
                              } else if (kilometers == null) {
                                _showToast('Please, Enter your Car Kilometers');
                              } else if (price.text.isEmpty) {
                                _showToast('Please, Enter your Car Price');
                              } else if (location == null) {
                                _showToast('Please, Enter Your Location');
                              } else if (description.text.length < 20) {
                                _showToast(
                                    'Please, Enter a Description over 20 letter');
                              } else if (controller.images.isEmpty) {
                                _showToast('Please, Pick Car Images');
                              } else {
                                snackbarController = Get.snackbar(
                                    'Loading.......', 'Please Wait',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.blue[900],
                                    colorText: Colors.white,
                                    duration: Duration(minutes: 60));
                                try {
                                  List<String> downloadURLs =
                                      await controller.uploadImagesToFirebase();
                                  print("Download URLs: $downloadURLs");
                                  await firestoreController.getUser();
                                  UserModel currentUser =
                                      firestoreController.user.value;
                                  PostModel post = PostModel(
                                      brand: brand,
                                      model: model.text,
                                      year: year,
                                      bodyType: bodyType,
                                      cylinders: cylinders,
                                      engineCapacity: engineCapcity,
                                      fuelType: fuelType,
                                      color: color.text,
                                      transmissionType: transmissionType,
                                      kilometers: kilometers,
                                      price: price.text,
                                      location: location,
                                      description: description.text,
                                      time: DateTime.now(),
                                      ownerName: currentUser.firstName! +
                                          ' ' +
                                          currentUser.lastName!,
                                      ownerMobile: currentUser.phoneNumber,
                                      images: downloadURLs);

                                  await firestoreController.editPost(
                                      post.id!, post, downloadURLs);

                                  await snackbarController!.close();
                                  await Get.offAll(bottomNavigation());
                                } catch (e) {
                                  snackbarController!.close();
                                  _showToast('Failed to Edit Post');
                                }
                              }
                            },
                            child: Text('Save Changes',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(36, 54, 101, 1.0))),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text(
                  'No Internet Connection',
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                )),
        ));
  }
}
