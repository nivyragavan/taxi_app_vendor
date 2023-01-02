import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      required this.hinttext,
      this.validator,
      this.keyboardtype})
      : super(key: key);
  final controller;
  final String hinttext;
  final validator;
  final keyboardtype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        cursorColor: blueGreen,
        decoration: InputDecoration(
          hintText: hinttext,
          contentPadding: const EdgeInsets.all(10),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: blueGreen, width: 2)),
        ),
        validator: validator,
        keyboardType: keyboardtype,
      ),
    );
  }
}
