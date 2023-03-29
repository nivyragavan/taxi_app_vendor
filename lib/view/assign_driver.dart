import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/models/car_number_list_model.dart';
import 'package:viswa_cab_vendor_app/models/driver_details_list_model.dart';
import 'package:viswa_cab_vendor_app/service/api_service.dart';
import 'package:viswa_cab_vendor_app/view/assigned_drivers_screen.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_elevatedbtn.dart';
import 'package:viswa_cab_vendor_app/widgets/customtext.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class AssignDriver extends StatefulWidget {
  AssignDriver({Key? key}) : super(key: key);

  @override
  State<AssignDriver> createState() => _AssignDriverState();
}

class _AssignDriverState extends State<AssignDriver> {
  final formKey = GlobalKey<FormState>();

  final vehicleNumber = TextEditingController();

  final driverName = TextEditingController();

  final driverContact = TextEditingController();

  CarNumberListModel? carNumberListModel;
  DriverDetailsListModel? driverDetailsListModel;

  bool isCarLoading = false;
  bool isDriverLoading = false;

  @override
  void initState() {
    super.initState();
    getCarData();
    getDriverData();
  }


  void getCarData() async {
    carNumberListModel = await ApiService().carNumberList();
    if(carNumberListModel != null){
      setState(() {
        isCarLoading = true;
      });
      setState(() {
        carNumberListModel = carNumberListModel;
      });
    }
  }

  void getDriverData() async {
    driverDetailsListModel = await ApiService().driverDetailsList();
    if(driverDetailsListModel != null){
      setState(() {
        isDriverLoading = true;
      });
      setState(() {
        driverDetailsListModel = driverDetailsListModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Assign Drivers'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
              CustomText(text: 'Car Register Number',fontsize: 17),
              SizedBox(height: 10),
              TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: vehicleNumber,
                      decoration: InputDecoration(
                        hintText: 'Select Car Register Number',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueGreen, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return carNumberListModel!.body!.carList!.where(
                            (item) => item.toString().toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (CarList val) {
                    this.vehicleNumber.text = val.carNumber!;
                    print(val);
                  },
                  itemBuilder: (_, CarList item) {
                    return ListTile(
                      title: Text(item.carNumber!),
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
              SizedBox(height: 20),
                  CustomText(text: 'Driver Name',fontsize: 17),
                  SizedBox(height: 10),
              TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: driverName,
                      decoration: InputDecoration(
                        hintText: 'Select Driver Name',
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueGreen, width: 2)),
                      )),
                  suggestionsCallback: (pattern) {
                    return driverDetailsListModel!.body!.driverList!.where((item) =>
                        item.toString().toLowerCase().contains(pattern.toLowerCase()));
                  },
                  onSuggestionSelected: (DriverList val) {
                    driverName.text = val.name!;
                    print(val);
                  },
                  itemBuilder: (_, DriverList item) {
                    return ListTile(
                      title: Text(item.name!),
                    );
                  },
                  getImmediateSuggestions: true,
                  hideSuggestionsOnKeyboardHide: true,
                  hideOnEmpty: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Select Driver Name';
                    }
                    return null;
                  }),
              SizedBox(height: 20),
                  CustomText(text: 'Driver Phone Number',fontsize: 17),
                  SizedBox(height: 10),
                  TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: driverContact,
                          decoration: InputDecoration(
                            hintText: 'Select Driver Phone Number',
                            contentPadding: const EdgeInsets.all(10),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blueGreen, width: 2)),
                          )),
                      suggestionsCallback: (pattern) {
                        return driverDetailsListModel!.body!.driverList!.where((item) =>
                            item.toString().toLowerCase().contains(pattern.toLowerCase()));
                      },
                      onSuggestionSelected: (DriverList val) {
                        driverContact.text = val.contact!;
                        print(val);
                      },
                      itemBuilder: (_, DriverList item) {
                        return ListTile(
                          title: Text(item.contact!),
                        );
                      },
                      getImmediateSuggestions: true,
                      hideSuggestionsOnKeyboardHide: true,
                      hideOnEmpty: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Select Driver Phone Number';
                        }
                        return null;
                      }),
              const SizedBox(height: 30),
              Center(
                child: CustomElevatedbutton(
                  text: "Assign",
                  fontsize: 18,
                  onPressed: () async{
                    if (formKey.currentState!.validate()) {
                      var data = await ApiService().assignDriver(vehicleNumber.text, driverName.text, driverContact.text);
                      if(data['statusCode'] == 1){
                        Fluttertoast.showToast(msg: "Driver Assigned Successfully");
                        Get.to(AssignedDriversScreen());
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: 'enter required fields', fontSize: 16);
                    }
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}