import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/home/home_view.dart';
import 'package:viswa_cab_vendor_app/view/splash_screen.dart';

void main() async{
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var vendorId = box.read('vendorId');
    print('=====vendor id${vendorId}=====');
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: blueGreen));
    WidgetsFlutterBinding.ensureInitialized();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Vendor App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home:vendorId == null ? const SplashScreen() : HomeView(),
    );
  }
}
