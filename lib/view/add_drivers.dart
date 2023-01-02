import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/camera.dart';
import 'package:viswa_cab_vendor_app/view/mydriver.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class AddDrivers extends StatefulWidget {
  AddDrivers({Key? key}) : super(key: key);

  @override
  State<AddDrivers> createState() => _AddDriversState();
}

class _AddDriversState extends State<AddDrivers> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String carmodel;
  late String regno;

  final name = TextEditingController();
  final contact = TextEditingController();
  final location = TextEditingController();
  final license = TextEditingController();
  final expiry = TextEditingController();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  int clickedDocType = 0;

  File? profileImage;
  File? aadhaarFront;
  File? aadhaarBack;
  File? licenseFront;
  File? licenseBack;

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
            profileImage = imageFile;
          });
        }
        break;
      case 2:
        {
          setState(() {
            aadhaarFront = imageFile;
          });
        }
        break;
      case 3:
        {
          setState(() {
            aadhaarBack = imageFile;
          });
        }
        break;
      case 4:
        {
          setState(() {
            licenseFront = imageFile;
          });
        }
        break;
      case 5:
        {
          setState(() {
            licenseBack = imageFile;
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

  static const districtList = [
    "Ariyalur",
    "Chengalpattu",
    "Chennai",
    "Coimbatore",
    "Cuddalore",
    "Dharmapuri",
    "Dindigul",
    "Erode",
    "Kallakurichi",
    "Kanchipuram",
    "Kanyakumari",
    "Karur",
    "Krishnagiri",
    "Madurai",
    "Mayiladuthurai",
    "Nagapattinam",
    "Namakkal",
    "Nilgiris",
    "Perambalur",
    "Pondicherry",
    "Pudukkottai",
    "Ramanathapuram",
    "Ranipet",
    "Salem",
    "Sivagangai",
    "Tenkasi",
    "Thanjavur",
    "Theni",
    "Thoothukudi",
    "Tiruchirappalli",
    "Tirunelveli",
    "Tirupattur",
    "Tiruppur",
    "Tiruvallur",
    "Tiruvannamalai",
    "Tiruvarur",
    "Vellore",
    "Viluppuram",
    "Virudhunagar"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: 'Add Drivers',
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
                      controller: name,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter driver name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter valid name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: blueGreen,
                      controller: contact,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter driver phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                            cursorColor: blueGreen,
                            controller: location,
                            decoration: InputDecoration(
                              hintText: 'Enter driver district',
                              contentPadding: const EdgeInsets.all(10),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: blueGreen, width: 2)),
                            )),
                        suggestionsCallback: (pattern) {
                          return districtList.where((item) => item
                              .toLowerCase()
                              .contains(pattern.toLowerCase()));
                        },
                        onSuggestionSelected: (String val) {
                          this.location.text = val;
                          print(val);
                        },
                        itemBuilder: (_, String item) {
                          return ListTile(
                            title: Text(item),
                          );
                        },
                        getImmediateSuggestions: true,
                        hideSuggestionsOnKeyboardHide: false,
                        hideOnEmpty: false,
                        noItemsFoundBuilder: (context) => const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('No item found'),
                            ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid district';
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: blueGreen,
                      controller: license,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Enter license number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: blueGreen, width: 2))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter license number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                        controller: expiry,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: blueGreen, width: 2)),
                            hintText: 'Enter license expiry date'),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              expiry.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid expiry date';
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    buildFileUploadButton('Profile Photo', 1),
                    const SizedBox(height: 10),
                    buildFileUploadButton('Aadhaar Front', 2),
                    const SizedBox(height: 10),
                    buildFileUploadButton('Aadhaar Back', 3),
                    const SizedBox(height: 10),
                    buildFileUploadButton('License Front', 4),
                    const SizedBox(height: 10),
                    buildFileUploadButton('License Back', 5),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Get.back();
                        validateAndSave();
                        Get.to(const MyDriver());
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
          return profileImage != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    profileImage!,
                    fit: BoxFit.cover,
                  ))
              : const Text('No File');
        }
      case 2:
        {
          return aadhaarFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    aadhaarFront!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 3:
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
      case 4:
        {
          return licenseFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    licenseFront!,
                    fit: BoxFit.fill,
                  ))
              : const Text('No File');
        }
      case 5:
        {
          return licenseBack != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    licenseBack!,
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
