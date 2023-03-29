import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/service/api_service.dart';
import 'package:viswa_cab_vendor_app/view/mycars.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

import 'camera.dart';

class AddCars extends StatefulWidget {
  AddCars({Key? key}) : super(key: key);

  @override
  State<AddCars> createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final regNo = TextEditingController();

  final model = TextEditingController();

  int clickedDocType = 0;

  File? carFront;
  File? carChassis;
  File? rcFront;
  File? rcBack;
  File? insurance;
  File? fcCopy;

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
            carFront = imageFile;
          });
        }
        break;
      case 2:
        {
          setState(() {
            carChassis = imageFile;
          });
        }
        break;
      case 3:
        {
          setState(() {
            rcFront = imageFile;
          });
        }
        break;
      case 4:
        {
          setState(() {
            rcBack = imageFile;
          });
        }
        break;
      case 5:
        {
          setState(() {
            insurance = imageFile;
          });
        }
        break;
      case 6:
        {
          setState(() {
            fcCopy = imageFile;
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

  var carModel = ["Mini", "Sedan", "SUV"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: 'Add Cars',
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: blueGreen,
                      controller: regNo,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Registration Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Registration Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: model,
                            cursorColor: blueGreen,
                            decoration: InputDecoration(
                              hintText: 'Select Model',
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: blueGreen, width: 2)),
                            )),
                        suggestionsCallback: (pattern) {
                          return carModel.where((item) => item
                              .toLowerCase()
                              .contains(pattern.toLowerCase()));
                        },
                        onSuggestionSelected: (String val) {
                          model.text = val;
                          print(val);
                        },
                        itemBuilder: (_, String item) {
                          return ListTile(
                            title: Text(item),
                          );
                        },
                        getImmediateSuggestions: true,
                        hideSuggestionsOnKeyboardHide: true,
                        hideOnEmpty: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Select Model';
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    buildFileUploadButton('Car Front Image', 1),
                    const SizedBox(height: 10),
                    buildFileUploadButton('Car Chassis Image', 2),
                    const SizedBox(height: 10),
                    buildFileUploadButton('RC Front', 3),
                    const SizedBox(height: 10),
                    buildFileUploadButton('RC Back', 4),
                    const SizedBox(height: 10),
                    buildFileUploadButton('Insurance', 5),
                    const SizedBox(height: 10),
                    buildFileUploadButton('FC Copy', 6),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async{
                       if(_formKey.currentState!.validate()){
                         var data = await ApiService().carRegister(regNo.text, model.text, carFront, carChassis, rcFront, rcBack, insurance,fcCopy);
                         if(data['statusCode'] == 1){
                           Fluttertoast.showToast(msg: 'Car Added Successfully');
                           Get.to(MyCars());
                           print('====success====');
                         }else{
                           print('====failed====');
                         }
                       }
                      },
                      style: ElevatedButton.styleFrom(primary: black),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
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
          return carFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    carFront!,
                    fit: BoxFit.cover,
                  ))
              : const Text('No File');
        }
      case 2:
        {
          return carChassis != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    carChassis!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 3:
        {
          return rcFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rcFront!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 4:
        {
          return rcBack != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rcBack!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 5:
        {
          return insurance != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    insurance!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 6:
        {
          return fcCopy != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    fcCopy!,
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
          side: BorderSide(color: blueGreen, width: 2)),
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
