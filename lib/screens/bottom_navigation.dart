import 'package:cars_store/controller/bottom_navigation_controller.dart';
import 'package:cars_store/screens/favorites_cars.dart';
import 'package:cars_store/screens/home.dart';
import 'package:cars_store/screens/user_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class bottomNavigation extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, bottomNavigationController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: bottomNavigationController.changeTabIndex,
            currentIndex: bottomNavigationController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.favorite,
                    size: 20.0,
                  ),
                ),
                label: 'Favorites',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.account_circle,
                    size: 20.0,
                  ),
                ),
                label: 'Account',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationController bottomNavigationController =
    Get.put(BottomNavigationController(), permanent: false);

    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          buildBottomNavigationMenu(context, bottomNavigationController),
          body: Obx(() => IndexedStack(
            index: bottomNavigationController.tabIndex.value,
            children: [
              home(),
              favoritesCars(),
              userAccount(),
            ],
          )),
        ));
  }
}