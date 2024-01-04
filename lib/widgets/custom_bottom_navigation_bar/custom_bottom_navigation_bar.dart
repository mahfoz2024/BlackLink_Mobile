import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'custom_bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final AppBar? appBar;

  const CustomBottomNavigationBar({super.key, this.appBar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
        init: CustomBottomNavigationBarController(),
        builder: (controller) {
          return Scaffold(
              appBar: appBar,
              body: controller.widgetOptions
                  .elementAt(controller.selectedIndex.value),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                backgroundColor: const Color(0xff1a1a55),
                selectedLabelStyle: const TextStyle(fontFamily: 'Tajawal'),
                unselectedLabelStyle: const TextStyle(fontFamily: 'Tajawal'),
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                onTap: controller.onItemTapped,
                currentIndex: controller.selectedIndex.value,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_outline_rounded,
                        size: 4.h,
                        color: Colors.white,
                      ),
                      activeIcon: Icon(
                        Icons.person,
                        size: 4.h,
                        color: Colors.white,
                      ),
                      label: 'My Account'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.explore_outlined,
                        size: 4.h,
                        color: Colors.white,
                      ),
                      activeIcon: Icon(
                        Icons.explore,
                        size: 4.h,
                        color: Colors.white,
                      ),
                      label: 'Explore'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.nightlight_outlined,
                        size: 4.h,
                        color: Colors.white,
                      ),
                      activeIcon: Icon(
                        Icons.nightlight,
                        size: 4.h,
                        color: Colors.white,
                      ),
                      label: 'Night Chat'),
                ],
              ));
        },
      ),
    );
  }
}
