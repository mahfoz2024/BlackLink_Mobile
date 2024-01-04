import 'dart:math';
import 'package:blacklink_mobile/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class ProgressButtonController extends GetxController {
  final stateTextWithIcon = ButtonState.idle.obs;

  void onPressedIconWithText() {
    switch (stateTextWithIcon.value) {
      case ButtonState.idle:
        stateTextWithIcon.value = ButtonState.loading;
        Future.delayed(
          const Duration(seconds: 1),
          () {
            stateTextWithIcon.value = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          },
        );
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

    stateTextWithIcon.value = stateTextWithIcon.value;
  }
}
