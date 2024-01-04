import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../shared_kernal/enum/error_enum.dart';

class HandlingErrorWidget extends StatelessWidget {
  final ResponseStatus responseStatus;

  const HandlingErrorWidget({Key? key, required this.responseStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (responseStatus) {
      case ResponseStatus.internalError:
        return const ErrorContainer(
            text: 'حدث خطأ داخلي \n يرجى المحاولة لاحقا');
      case ResponseStatus.notFound:
        return const ErrorContainer(text: 'لم يتم ايجاد العنصر 404');
      case ResponseStatus.unAuthorized:
        return const ErrorContainer(text: 'غير مخول لك بالولوج 401');
      case ResponseStatus.connectTimeout:
        return const ErrorContainer(text: 'انتهت مهلة الاتصال');
      case ResponseStatus.receiveTimeout:
        return const ErrorContainer(text: 'انتهت مهلة الاتصال');
      case ResponseStatus.other:
        return const ErrorContainer(text: 'حدث خطأ غير معروف');
      case ResponseStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      default:
        return Container(
          width: 35.w,
          height: 5.h,
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        );
    }
  }
}

class ErrorContainer extends StatelessWidget {
  final String text;

  const ErrorContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 5.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.h),
          border: Border.all(color: Colors.white)),
      child: FittedBox(
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
