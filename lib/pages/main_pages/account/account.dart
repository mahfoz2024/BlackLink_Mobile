import 'package:blacklink_mobile/pages/login/login.dart';
import 'package:blacklink_mobile/pages/main_pages/account/account_controller.dart';
import 'package:blacklink_mobile/shared_kernal/base_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../../../shared_kernal/enum/error_enum.dart';
import '../../../widgets/handling_error_widget.dart';
import 'profile_settings/profile_settings.dart';

class Account extends StatelessWidget {
  Account({super.key});
  final box = GetStorage();
  final controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1a35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              "Account",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20.sp,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.loading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.errorType.value != ResponseStatus.other) {
                  return HandlingErrorWidget(
                      responseStatus: controller.errorType.value);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                baseURL + controller.user.value.mainPhoto!),
                            radius: 12.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.user.value.nickName!,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              " , ",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              controller.user.value.age.toString(),
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to( ProfileSettings());
                        },
                        child: Container(
                          width: 20.w,
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
                                  Icons.edit,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Edit',
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
                      SizedBox(height: 5.h,),
                      InkWell(
                        onTap: (){
                          box.remove('token');
                          Get.offAll(LogIn());
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
                                  Icons.edit,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                                Text(
                                  'LogOut',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],

                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              }
            })
          ],
        ),
      ),
    );
  }
}
