import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_elevatedbtn.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_textfield.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class AssignDriver extends StatelessWidget {
  AssignDriver({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final vehicleNumber = TextEditingController();
  final driverName = TextEditingController();
  final driverPhonenumber = TextEditingController();
  final licenseNumber = TextEditingController();
  var regNumber = [
    "TN56A6513",
    "TN12A3453",
    "TN56A6343",
    "TN16A2333",
    "TN26A6563",
    "TN54A9893",
    "TN32Z6803",
    "TN89A6513",
  ];
  var drivers = ["arjun", "ragu", "raj"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Assign Drivers'),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            VehicleDropdown(vehicleNumber: vehicleNumber, regNumber: regNumber),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: driverName,
                      decoration: InputDecoration(
                        hintText: 'Select Driver',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueGreen, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return drivers.where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (String val) {
                    driverName.text = val;
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
                      return 'Select Driver';
                    }
                    return null;
                  }),
            ),
            CustomTextField(
              hinttext: 'Driver Phone Number',
              controller: driverPhonenumber,
              validator: (value) {
                if (value?.length != 10) {
                  return 'Enter Correct Phonenumber';
                }
              },
              keyboardtype: TextInputType.number,
            ),
            CustomTextField(
              hinttext: 'License number',
              controller: licenseNumber,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter License Number';
                }
              },
              keyboardtype: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomElevatedbutton(
              text: "Assign",
              fontsize: 18,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Fluttertoast.showToast(msg: "Driver Assigned Successfully");
                } else {
                  Fluttertoast.showToast(
                      msg: 'enter required fields', fontSize: 16);
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}

class VehicleDropdown extends StatelessWidget {
  const VehicleDropdown({
    Key? key,
    required this.vehicleNumber,
    required this.regNumber,
  }) : super(key: key);

  final TextEditingController vehicleNumber;
  final List<String> regNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
              controller: vehicleNumber,
              decoration: InputDecoration(
                hintText: 'Select your Vehicle',
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2)),
              )),
          suggestionsCallback: (pattern) {
            return regNumber.where(
                (item) => item.toLowerCase().contains(pattern.toLowerCase()));
          },
          onSuggestionSelected: (String val) {
            this.vehicleNumber.text = val;
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
              return 'Select Vehicle Number';
            }
            return null;
          }),
    );
  }
}
