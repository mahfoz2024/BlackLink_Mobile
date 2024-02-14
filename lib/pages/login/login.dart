import 'package:blacklink_mobile/pages/login/login_controller.dart';
import 'package:blacklink_mobile/pages/signUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:sizer/sizer.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff1a1a35),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 4.w),
            child: InkWell(
              onTap: (){
                Get.to( SignUp());
              },
              child: Container(
                width: 30.w,
                height: 5.h,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(1.h)),
                child: Padding(
                  padding:  EdgeInsets.all(1.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.assignment_ind_outlined,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                      Text(
                        'SignUp',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],

                  ),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xff1a1a35),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/applogo.png',
                width: 120.w,
                height: 50.h,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'User Name',
                    style: TextStyle(
                        color: const Color(0xff605e8a), fontSize: 14.sp),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller.username,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your User Name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Your User Name',
                    hintStyle: TextStyle(color: Color(0xff7473a0)),
                    filled: true,
                    fillColor: Color(0xff0e0c23),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff211e40)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff211e40)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 2.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                        color: const Color(0xff605e8a), fontSize: 14.sp),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: TextFormField(
                  obscureText: true,
                  controller: controller.password,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(color: Color(0xff7473a0)),
                    filled: true,
                    fillColor: Color(0xff0e0c23),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff211e40)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff211e40)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.0.h),
              Obx(() {
                return ProgressButton.icon(
                    radius: 1.h,
                    textStyle: TextStyle(fontSize: 15.sp, color: Colors.white),
                    iconedButtons: {
                      ButtonState.idle: IconedButton(
                          text: 'LogIn',
                          icon: const Icon(Icons.login, color: Colors.white),
                          color: Colors.deepPurple.shade500),
                      ButtonState.loading: IconedButton(
                          text: 'Loading', color: Colors.deepPurple.shade700),
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
              })
            ],
          ),
        ),
      ),
    );
  }
}

