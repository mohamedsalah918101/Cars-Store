import 'package:cars_store/controller/bottom_navigation_controller.dart';
import 'package:cars_store/controller/connectivity_controller.dart';
import 'package:cars_store/controller/firestore_controller.dart';
import 'package:cars_store/screens/favorites_cars.dart';
import 'package:cars_store/screens/home.dart';
import 'package:cars_store/screens/user_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class bottomNavigation extends StatelessWidget {
  final FirestoreController firestoreController=Get.put(FirestoreController());
  final ConnectivityController connectivityController=Get.put(ConnectivityController());
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, bottomNavigationController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: bottomNavigationController.changeTabIndex,
            currentIndex: bottomNavigationController.tabIndex.value,
            backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.favorite,
                    size: 20.0,
                  ),
                ),
                label: 'Favourites',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.account_circle,
                    size: 20.0,
                  ),
                ),
                label: 'Account',
                backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavigationController =
    Get.put(BottomNavigationController(), permanent: false);
    getData();
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          buildBottomNavigationMenu(context, bottomNavigationController),
          body: Obx(() => connectivityController.isConnected.value ?IndexedStack(
            index: bottomNavigationController.tabIndex.value,
            children: [
              home(),
              favoritesCars(),
              userAccount(),
            ],
          ):const Center(child: Text('No Internet Connection',style: TextStyle(fontSize: 30,color: Colors.grey),))),
        ));
  }
  getData() async {
    await firestoreController.getUser();
    await firestoreController.getPosts();
  }
}
