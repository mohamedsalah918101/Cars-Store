import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
class ConnectivityController extends GetxController{
  var isConnected=true.obs;
  @override
  void onInit() {
    checkInternet();
    Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
    super.onInit();
  }
  Future<void> checkInternet() async {
    ConnectivityResult connectivityResult=await Connectivity().checkConnectivity();
    if(connectivityResult ==ConnectivityResult.none){
      isConnected.value=false;
    }else{
      isConnected.value=true;
    }
  }
}