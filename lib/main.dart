import 'dart:io';
import 'package:blacklink_mobile/pages/login/login.dart';
import 'package:blacklink_mobile/pages/signUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(BlackLinkApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class BlackLinkApp extends StatelessWidget {
  BlackLinkApp({super.key});

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Black Link',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Tajawal',
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff1a1a35))),
        debugShowCheckedModeBanner: false,
        home: box.read('token')==null?LogIn():const CustomBottomNavigationBar(),
      );
    });
  }
}
