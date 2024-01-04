import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool liked = false;

  String heartSvg = 'heart.svg';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          liked = !liked;
          heartSvg = liked == false ? 'heart.svg' : 'heartActive.svg';
        });
      },
      child: Container(
        width: 10.h,
        height: 10.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color(0xff1a1a55), shape: BoxShape.circle),
        child: SvgPicture.asset(
          "assets/svg/$heartSvg",
          height: 4.h,
          color: Colors.amber,
        ),
      ),
    );
  }
}
