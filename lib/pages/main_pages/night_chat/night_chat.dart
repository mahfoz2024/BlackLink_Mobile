
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../User/chats_list.dart';
import 'night_chat_controller.dart';

class NightChat extends StatelessWidget {
  NightChat({super.key});
  final controller = Get.put(NightChatController());

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
              padding: EdgeInsets.only(left: 2.w, top: 2.h),
              child: Text(
                "BlackLink",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.chat, size: 3.h),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ChatsList()));
              },
            ),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              icon: Icon(Icons.notifications, size: 3.h),
              onPressed: () {},
            ),
          ]),
      body: const SingleChildScrollView(
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
