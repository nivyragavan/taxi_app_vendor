import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/camera.dart';
import 'package:viswa_cab_vendor_app/view/home/home_view.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int clickedDocType = 0;

  File? profileImage;

  void pickImage(int type) async {
    File? imageFile;
    if (type == 0) {
      imageFile = await cameraImage();
    } else {
      imageFile = await galleryImage();
    }
    print(imageFile);
    print(clickedDocType);
    setState(() {
      profileImage = imageFile;
    });
  }

  Future<File?> galleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
      return null;
    }
  }

  Future<File?> cameraImage() async {
    try {
      final image = await Get.to(const TakePhoto());
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Profile'),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(child: buildProfile()),
    );
  }

  buildProfile() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Center(
            child: buildProfileImage(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ID Number :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(
                'Vendor_1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Name',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextField(
            //controller: controller.nameController,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone Number',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextField(
            //controller: controller.phoneController,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Other Phone Number(Optional)',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextField(
            //controller: controller.phoneController,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.off(const HomeView());
                },
                style: ElevatedButton.styleFrom(
                    primary: black, padding: const EdgeInsets.all(10)),
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }

  buildProfileImage() {
    return GestureDetector(
      onTap: () {
        buildBottomSheet();
      },
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: profileImage != null
              ? Image.file(
                  profileImage!,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  'assets/images/driver.png',
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }

  buildBottomSheet() {
    return Get.bottomSheet(Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
              onPressed: () {
                Get.back();
                pickImage(0);
              },
              icon: Icon(
                Icons.camera_outlined,
                color: blueGreen,
                size: 30,
              ),
              label: Text(
                'Camera',
                style: TextStyle(
                    color: blueGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          TextButton.icon(
              onPressed: () {
                Get.back();
                pickImage(1);
              },
              icon: Icon(
                Icons.image_outlined,
                color: blueGreen,
                size: 30,
              ),
              label: Text(
                'Gallery',
                style: TextStyle(
                    color: blueGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    ));
  }
}
