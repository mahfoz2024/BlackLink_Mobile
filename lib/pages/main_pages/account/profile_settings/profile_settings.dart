import 'package:blacklink_mobile/pages/main_pages/account/profile_settings/profile_settings_controller.dart';
import 'package:blacklink_mobile/shared_kernal/base_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../widgets/spinner_loading.dart';

class ProfileSettings extends StatelessWidget {
  ProfileSettings({super.key});

  final controller = Get.put(ProfileSettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff1a1a35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              "Profile Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Obx(() {
            if (controller.loading.isTrue) {
              return const SpinnerLoading();
            } else {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Photos',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Photos can be moved around, so it is better to put the best photo first',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: controller.images.length +
                          (controller.images.length < 6 ? 1 : 0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == controller.images.length) {
                          // Show camera icon if needed
                          return GestureDetector(
                            onTap: () async {
                              await controller.pickImage(context);
                            },
                            child: Center(
                              child: Container(
                                width: 14.h,
                                height: 14.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.h),
                                    color: Colors.grey[700]),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/camera.png',
                                    width: 14.h,
                                    height: 14.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return GestureDetector(
                              onTap: () async {
                                await controller.pickImage(context);
                              },
                              child: Center(
                                child: Container(
                                  width: 14.h,
                                  height: 14.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(1.h),
                                      color: Colors.grey[700]),
                                  child: controller.images[index].isBlank ==
                                      true
                                      ? Center(
                                      child: Image.asset(
                                        'assets/images/camera.png',
                                        width: 14.h,
                                        height: 14.h,
                                        fit: BoxFit.cover,
                                      ))
                                      : Center(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(
                                              1.h),
                                          child: Image.network(
                                            baseURL +
                                                controller
                                                    .images[index].url!,
                                            width: 14.h,
                                            height: 14.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        IconButton(
                                            iconSize: 3.h,
                                            color: Colors.red,
                                            onPressed: () {
                                              controller.removePhoto(
                                                  controller
                                                      .images[index]
                                                      .id!);
                                            },
                                            icon: const Icon(Icons
                                                .remove_circle_rounded))
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        }
                      }),
                ),
                SizedBox(
                  height: 3.h,
                ),
                editBio()
              ],
            );
            }
          }),
        ),
      ),
    ));
  }

  Widget editBio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About You',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Write something about yourself to increase your rating by 5%',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tell us about yourself',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            Visibility(
              visible: controller.showDoneButton.value,
              child: IconButton(
                onPressed: () {
                  controller.setBio();
                  controller.showDoneButton.value = false;
                },
                icon: const Icon(Icons.done),
                color: Colors.white,
              ),
            )
          ],
        ),
        TextFormField(
          maxLines: 5,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          controller: controller.bio,
          onChanged: (text) {
            // Detect text changes
            controller.showDoneButton.value =
                text.isNotEmpty; // Show button if text is not empty
          },
          decoration: const InputDecoration(
            hintText: 'Share something about what you do',
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
      ],
    );
  }
}
