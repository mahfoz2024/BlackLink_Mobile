import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../../widgets/sign_up_text_box.dart';
import 'sign_up_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1a35),
      appBar: AppBar(
        title: const Text(
          'SignUP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff1a1a35),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    await controller.pickImage(context);
                  },
                  child: Obx(() {
                    return Center(
                      child: Container(
                        width: 60.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                            color: Colors.grey[700]
                        ),
                        child: controller.image.value == null
                            ? Center(
                                child: Image.asset(
                                'assets/images/camera.png',
                                width: 50.w,
                                height: 20.h,
                                fit: BoxFit.cover,
                              ))
                            : Center(
                                child: Image.file(
                                  File(controller.image.value!.path),
                                  width: 60.w,
                                  height: 30.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 4.0.h),
                SignUpTextBox(
                  title: 'NiceName',
                  obscureText: false,
                  controller: controller.niceNameController,
                  type: TextInputType.name,
                ),
                SizedBox(height: 1.0.h),
                SignUpTextBox(
                  title: 'Email',
                  obscureText: false,
                  controller: controller.emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 1.0.h),
                SignUpTextBox(
                  title: 'User Name',
                  obscureText: false,
                  controller: controller.usernameController,
                  type: TextInputType.name,
                ),
                SizedBox(height: 1.0.h),
                SignUpTextBox(
                  title: 'Password',
                  obscureText: true,
                  controller: controller.passwordController,
                  type: TextInputType.name,
                ),
                SizedBox(height: 1.0.h),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'Gender',
                    hintStyle: TextStyle(color: Color(0xff7473a0)),
                    filled: true,
                    fillColor: Color(0xff0e0c23),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1a1a35)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1a1a35)),
                    ),
                  ),
                  value: null,
                  items: ['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Color(0xff7473a0)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.gender = newValue;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1.0.h),
                Obx(() {
                  return TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Enter your birth date',
                      hintStyle: TextStyle(color: Color(0xff7473a0)),
                      filled: true,
                      fillColor: Color(0xff0e0c23),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1a1a35)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1a1a35)),
                      ),
                    ),
                    onTap: () => controller.selectDate(context),
                    controller: controller.textEditingController.value,
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your birth date';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: 2.0.h),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await controller.signUp();
                      }
                    },
                    child: Container(
                      width: 50.w,
                      height: 6.h,
                      padding: EdgeInsets.only(top: 1.h),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(1.h)),
                      child: Center(
                        child: Text(
                          'SignUp',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
