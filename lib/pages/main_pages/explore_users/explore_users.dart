import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../shared_kernal/enum/error_enum.dart';
import '../../../widgets/handling_error_widget.dart';
import '../../../widgets/user_card.dart';
import '../../User/user_profile/user_profile.dart';
import 'explore_users_controller.dart';

class ExploreUsers extends StatelessWidget {
  ExploreUsers({super.key});

  final controller = Get.put(ExploreUsersController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1a1a35),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text(
                "Explore :",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      return ListView.builder(
                          itemCount: controller.users.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                child: UserCard(user: controller.users[index]),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return UserProfile();
                                }));
                              },
                            );
                          });
                    }
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
