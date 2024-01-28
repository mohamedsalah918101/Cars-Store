import 'package:get/get.dart';

class GalleryController extends GetxController {
  RxList<String> selectedPhotos = <String>[].obs;

  void addPhoto(String imagePath) {
    selectedPhotos.add(imagePath);
  }
}