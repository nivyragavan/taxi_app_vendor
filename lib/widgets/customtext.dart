import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.color, this.fontsize, this.fontWeight})
      : super(key: key);
  final String text;
  final color;
  final double? fontsize;
  final fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize ?? 16,
        fontWeight: fontWeight
      ),
      textScaleFactor: Get.textScaleFactor,
    );
  }
}
