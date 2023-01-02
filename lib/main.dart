import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: blueGreen));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Taxi Vendor App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const SplashScreen(),
    );
  }
}
