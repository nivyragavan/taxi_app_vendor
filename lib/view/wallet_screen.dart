import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/view/assign_driver.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_elevatedbtn.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_textfield.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  final vehicleNumber = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Wallet'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            children: [
              VehicleDropdown(
                  vehicleNumber: vehicleNumber, regNumber: regNumber),
              CustomTextField(
                hinttext: 'Enter Amount',
                keyboardtype: TextInputType.number,
                validator: (value) {
                  if (value!.length < 2) {
                    return 'enter above 100';
                  }
                },
                controller: amount,
              ),
              CustomElevatedbutton(
                text: "Recharge",
                fontsize: 18,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //ippo pay
                    print("Success");
                  } else {
                    print('enter required fields');
                  }
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
