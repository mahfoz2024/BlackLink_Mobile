import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared_kernal/base_strings.dart';
import '../../../shared_kernal/enum/error_enum.dart';
import '../../../widgets/handling_error_widget.dart';
import 'user_profile_controller.dart';

class UserProfile extends StatelessWidget {
  final String id;

  UserProfile({super.key, required this.id});
  final controller=Get.put(UserProfileController());
  final pageController = PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    controller.id=id;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1a1a35),
        body: Center(
          child: SingleChildScrollView
            (
              child:
              Obx((){
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
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(2.h)),
                                  child: PageView.builder(
                                      controller: pageController,
                                      itemCount: controller
                                          .user.value.userPhotos!.length,
                                      itemBuilder: (_, index) {
                                        return Hero(
                                          tag: baseURL +
                                              controller
                                                  .user.value.userPhotos![index],
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(baseURL +
                                                        controller.user.value
                                                            .userPhotos![index]),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                BorderRadius.circular(2.h)),
                                          ),
                                        );
                                      }),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 2.w, top: 1.h),
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                          ),
                                          alignment: Alignment.topLeft),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(right: 1.w, top: 1.h),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_vert_sharp,
                                            color: Colors.white,
                                          ),
                                          alignment: Alignment.topLeft),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child: SmoothPageIndicator(
                                          controller: pageController,
                                          count: controller
                                              .user.value.userPhotos!.length,
                                          effect: const WormEffect(
                                              dotColor: Colors.grey,
                                              activeDotColor: Colors.white),
                                          onDotClicked: (index) {}),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 1.h),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                controller.user.value.nickName!,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                " , ",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                controller.user.value.age.toString(),
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.w,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 0.7.h,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 2.h),
                          child: Text(
                            "ماذا عني :",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: Text(
                            controller.user.value.bio!,
                            style:
                            TextStyle(fontSize: 13.sp, color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 1.h),
                          child: Text(
                            "الاهتمامات :",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        /*Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: Wrap(
                              textDirection: TextDirection.rtl,
                              spacing: 3.5.w,
                              children: List.generate(
                                controller.user.value.interests!.length,
                                (index) => Chip(
                                  backgroundColor: Color(
                                          (Random().nextDouble() * 0xFFFFFF)
                                              .toInt())
                                      .withOpacity(1),
                                  label: Text(
                                    controller.user.value.interests![index].interestName!,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Color(
                                              (Random().nextDouble() * 0xFFFFFF)
                                                  .toInt())
                                          .withOpacity(1),
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              )),
                        )*/
                      ],
                    );
                  }
                }
              })
          ),
        ),
      ),
    );
  }
}
