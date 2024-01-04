import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/main_pages/account/account.dart';
import '../../pages/main_pages/explore_users/explore_users.dart';
import '../../pages/main_pages/night_chat/night_chat.dart';

class CustomBottomNavigationBarController extends GetxController {
  RxInt selectedIndex = 1.obs;
  final List<Widget> widgetOptions = <Widget>[
    Account(),
    ExploreUsers(),
    NightChat(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
