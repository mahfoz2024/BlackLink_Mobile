import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../data/models/users_list_model.dart';
import '../shared_kernal/base_strings.dart';
import 'fav_button.dart';

class UserCard extends StatelessWidget {
  final UserListModel user;
  const UserCard({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
          image:  DecorationImage(
              image: NetworkImage(baseURL+user.mainPhotoUrl!), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(4.h),
          color: const Color(0xff31314d)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.h),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    width: 40.w,
                    height: 7.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.30),
                    ),
                    child: Text(
                      "Software Developer",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.h),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 5.0,
                                sigmaY: 5.0,
                              ),
                              child: Container(
                                width: 10.h,
                                height: 10.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.30),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 4.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.h),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5.0,
                                  sigmaY: 5.0,
                                ),
                                child: Container(
                                  width: 10.h,
                                  height: 10.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.30),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                    size: 4.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {}, child: const FavButton()),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Row(
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  )),
                              Text(
                                "2 km away",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    height: 0,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                              user.niceName!,
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
                                user.age.toString(),
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    height: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1.w,
                            ),
                            child: Row(
                              textDirection: TextDirection.ltr,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 0.7.h,
                                  ),
                                ),
                                Text(
                                  "Active Now",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      height: 0,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
