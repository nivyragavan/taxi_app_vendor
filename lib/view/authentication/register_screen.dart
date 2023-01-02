import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/authentication/login_screen.dart';
import 'package:viswa_cab_vendor_app/view/camera.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  int clickedDocType = 0;

  File? aadhaarFront;
  File? aadhaarBack;
  File? pan;
  File? passbook;
  File? rental1;
  File? rental2;

  void pickImage(int type) async {
    File? imageFile;
    if (type == 0) {
      imageFile = await cameraImage();
    } else {
      imageFile = await galleryImage();
    }
    print(imageFile);
    print(clickedDocType);
    switch (clickedDocType) {
      case 1:
        {
          setState(() {
            aadhaarFront = imageFile;
          });
        }
        break;
      case 2:
        {
          setState(() {
            aadhaarBack = imageFile;
          });
        }
        break;
      case 3:
        {
          setState(() {
            pan = imageFile;
          });
        }
        break;
      case 4:
        {
          setState(() {
            passbook = imageFile;
          });
        }
        break;
      case 5:
        {
          setState(() {
            rental1 = imageFile;
          });
        }
        break;
      case 6:
        {
          setState(() {
            rental2 = imageFile;
          });
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
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
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'REGISTER',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: blueGreen,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueGreen, width: 2))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid name";
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: blueGreen,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueGreen, width: 2))),
                  validator: (value) {
                    if (value?.length != 10) {
                      return "Enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: blueGreen,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueGreen, width: 2))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: blueGreen,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueGreen, width: 2))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password again";
                    }
                  },
                ),
                const SizedBox(height: 10),
                buildFileUploadButton('Aadhaar Front', 1),
                const SizedBox(height: 10),
                buildFileUploadButton('Aadhaar Back', 2),
                const SizedBox(height: 10),
                buildFileUploadButton('Pan Card', 3),
                const SizedBox(height: 10),
                buildFileUploadButton('Passbook (optional)', 4),
                const SizedBox(height: 10),
                buildFileUploadButton(
                    'Rental Agreement 1st page (optional)', 5),
                const SizedBox(height: 10),
                buildFileUploadButton(
                    'Rental Agreement 2st page (optional)', 6),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blueGreen, minimumSize: const Size(120, 45)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(LoginScreen());
                      }
                    },
                    child: const Text('REGISTER',
                        style: TextStyle(fontSize: 20, letterSpacing: 2))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2)),
                    TextButton(
                      style: TextButton.styleFrom(primary: blueGreen),
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      child: const Text('Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  buildFileUploadButton(String title, int type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(title,
                style: const TextStyle(fontSize: 18, color: black))),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: getData(type),
        ),
        buildUploadButton(type)
      ],
    );
  }

  Widget getData(int type) {
    switch (type) {
      case 1:
        {
          return aadhaarFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    aadhaarFront!,
                    fit: BoxFit.cover,
                  ))
              : const Text('No File');
        }
      case 2:
        {
          return aadhaarBack != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    aadhaarBack!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 3:
        {
          return pan != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    pan!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 4:
        {
          return passbook != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    passbook!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 5:
        {
          return rental1 != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rental1!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 6:
        {
          return rental2 != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rental2!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      default:
        {
          return const Text('No File');
        }
    }
  }

  buildUploadButton(int type) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: blueGreen, width: 2),
      ),
      onPressed: () {
        onPress(type);
      },
      child: const Text(
        'Upload',
        style: TextStyle(color: black, fontSize: 15),
      ),
    );
  }

  void onPress(int id) {
    print('pressed $id');
    clickedDocType = id;
    buildBottomSheet();
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
