import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: 10.h,
        height: 10.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color(0xff1a1a55), shape: BoxShape.circle),
        child: SvgPicture.asset(
          "assets/svg/heartActive.svg",
          height: 4.h,
          color: Colors.red,
        ),
      ),
    );
  }
}
