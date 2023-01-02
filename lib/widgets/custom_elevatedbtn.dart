import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';

class CustomElevatedbutton extends StatelessWidget {
  const CustomElevatedbutton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.color,
      this.fontsize,
      this.fontWeight})
      : super(key: key);
  final onPressed;
  final String text;

  final color;
  final double? fontsize;
  final fontWeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
        child: Text(
          text,
          style: TextStyle(
              color: color, fontSize: fontsize ?? 16, fontWeight: fontWeight),
          textScaleFactor: Get.textScaleFactor,
        ));
  }
}
