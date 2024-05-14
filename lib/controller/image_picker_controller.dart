import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagePickerController extends GetxController {
  RxList<File> images = <File>[].obs;

  Future pickImages() async {
    try {
      final imagePicks = await ImagePicker().pickMultiImage();
      if (imagePicks.isEmpty) {
        return;
      }
      images.value = imagePicks.map((imagePick) => File(imagePick.path)).toList();
    } on PlatformException catch (e) {
      return e;
    }
  }

  RxList<String> networkImages = <String>[].obs;

  Future<List<String>> uploadImagesToFirebase() async {
    List<String> downloadURLs = [];

    for (File imageFile in images) {
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
        Reference reference = FirebaseStorage.instance
            .ref()
            .child('uploadedPictures/$fileName.png');

        await reference.putFile(imageFile);

        String downloadURL = await reference.getDownloadURL();
        networkImages.add(downloadURL);
        downloadURLs.add(downloadURL);
    }

    return downloadURLs;
  }
}