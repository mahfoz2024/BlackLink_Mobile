import 'dart:math';

import 'package:blacklink_mobile/data/web_services/auth_web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class LogInController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final service = AuthWebServices();

  Future<void> login() async {
    int code = await service.logIn(username.text, password.text);
    if (code == 401) {
      Get.defaultDialog(
          backgroundColor: const Color(0xff605e8a),
          title: 'Error',
          middleText: 'email or password is wrong');
    }
    if (code == 200) Get.to(const CustomBottomNavigationBar());
  }
  final stateTextWithIcon = ButtonState.idle.obs;

  Future <void> onPressedIconWithText() async{
    if(formKey.currentState!.validate()) {
      switch (stateTextWithIcon.value) {
      case ButtonState.idle:
        stateTextWithIcon.value = ButtonState.loading;
        await login();
        stateTextWithIcon.value = Random.secure().nextBool()
            ? ButtonState.success
            : ButtonState.fail;
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon.value = ButtonState.idle;
        Get.offAll(const CustomBottomNavigationBar());
        break;
      case ButtonState.fail:
        stateTextWithIcon.value = ButtonState.idle;
        break;
    }
    }
    stateTextWithIcon.value = stateTextWithIcon.value;
  }
}
