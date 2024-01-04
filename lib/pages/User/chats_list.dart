import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Text(
              "محادثاتك",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            height: 9.h,
                            width: 9.h,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/1.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 0.6.h,
                                      ),
                                    ),
                                    Text(
                                      'هلينا مارديني',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.sp),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 68.w,
                                child: Text(
                                  'شسيشسيشيشسيشيشيقثصقصقفاليبليفيقفيقفيقفقفقيفيبلقفقف',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11.sp,
                                      overflow: TextOverflow.ellipsis),
                                  textDirection: TextDirection.rtl,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
