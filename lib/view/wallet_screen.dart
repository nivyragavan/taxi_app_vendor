import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_elevatedbtn.dart';
import 'package:viswa_cab_vendor_app/widgets/custom_textfield.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';
import '../constants/colors.dart';
import '../models/car_number_list_model.dart';
import '../service/api_service.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final formKey = GlobalKey<FormState>();

  final amount = TextEditingController();

  final vehicleNumber = TextEditingController();

  CarNumberListModel? carNumberListModel;

  bool isCarLoading = false;

  @override
  void initState() {
    super.initState();
    getCarData();
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
              const SizedBox(height: 20,),
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
              SizedBox(height: 20,),
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
