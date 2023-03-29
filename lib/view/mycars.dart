import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/CarDetailedScreen.dart';
import 'package:viswa_cab_vendor_app/view/add_cars.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

import '../models/approved_car_list_model.dart';
import '../service/api_service.dart';

class MyCars extends StatefulWidget {
  const MyCars({Key? key}) : super(key: key);

  @override
  State<MyCars> createState() => _MyCarsState();
}

class _MyCarsState extends State<MyCars> {
  ApprovedCarListModel? approvedCarListModel;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    approvedCarListModel = await ApiService().approvedCarList();
    if (approvedCarListModel != null) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        approvedCarListModel = approvedCarListModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'My Cars'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height,
                child: isLoading == false ? Center(
                    child: CircularProgressIndicator(color: blueGreen,)
                )
                    :  approvedCarListModel!.body!.carapprovedvendorList!.isEmpty
                    ? Center(
                        child: Image.asset('assets/images/nodatafound.png')
                      )
                    : ListView.builder(
                  itemCount: approvedCarListModel!.body!.carapprovedvendorList!.length,
                        itemBuilder: (context, index) {
                    var e = approvedCarListModel!.body!.carapprovedvendorList![index];
                          return Card(
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${e.carNumber}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                              ),
                              subtitle: Text(
                                '${e.model}',
                                style:TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 17),
                              ),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: (){
                                Get.to(CarDetailedScreen(carDetails: e));
                              },
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueGreen,
        onPressed: () {
          Get.to(AddCars());
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
