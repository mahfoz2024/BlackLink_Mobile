
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpTextBox extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;

  const SignUpTextBox(
      {super.key,
      required this.title,
      required this.controller,
      required this.obscureText,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: const Color(0xff605e8a), fontSize: 14.sp),
        ),
        TextFormField(
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          keyboardType: type,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $title';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Enter Your $title',
            hintStyle: const TextStyle(color: Color(0xff7473a0)),
            filled: true,
            fillColor: const Color(0xff0e0c23),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff211e40)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff211e40)),
            ),
          ),
        ),
      ],
    );
  }
}
