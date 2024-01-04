import 'package:blacklink_mobile/widgets/progress_button/progress_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';

class ProgressButtonWidget extends StatelessWidget {
  ProgressButtonWidget({super.key});

  final stateOnlyText = ButtonState.idle;
  final controller = Get.put(ProgressButtonController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProgressButton.icon(
          radius: 1.h,
          textStyle: TextStyle(fontSize: 15.sp, color: Colors.white),
          iconedButtons: {
            ButtonState.idle: IconedButton(
                text: 'LogIn',
                icon: const Icon(Icons.login, color: Colors.white),
                color: Colors.deepPurple.shade500),
            ButtonState.loading:
            IconedButton(text: 'Loading', color: Colors.deepPurple.shade700),
            ButtonState.fail: IconedButton(
                text: 'Failed',
                icon: const Icon(Icons.cancel, color: Colors.white),
                color: Colors.red.shade300),
            ButtonState.success: IconedButton(
                text: 'Success',
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                color: Colors.green.shade400)
          },
          onPressed: controller.onPressedIconWithText,
          state: controller.stateTextWithIcon.value);
    });
  }


}
