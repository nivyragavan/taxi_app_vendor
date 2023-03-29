import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/models/approved_driver_list_model.dart';
import 'package:viswa_cab_vendor_app/service/api_service.dart';
import 'package:viswa_cab_vendor_app/view/add_drivers.dart';
import 'package:viswa_cab_vendor_app/view/driver_detailed_screen.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class MyDriver extends StatefulWidget {
  const MyDriver({Key? key}) : super(key: key);

  @override
  State<MyDriver> createState() => _MyDriverState();
}

class _MyDriverState extends State<MyDriver> {
  ApprovedDriverListModel? approvedDriverListModel;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    approvedDriverListModel = await ApiService().approvedDriverList();
    if (approvedDriverListModel != null) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        approvedDriverListModel = approvedDriverListModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'My Drivers',
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height,
                child:  isLoading == false ? Center(
                    child: CircularProgressIndicator(color: blueGreen,)
                )
                    :  approvedDriverListModel!.body!.driverapprovedvendorList!.isEmpty
                    ? Center(
                     child: Image.asset('assets/images/nodatafound.png')
                )
                    : ListView.builder(
                        itemCount: approvedDriverListModel!.body!.driverapprovedvendorList!.length,
                        itemBuilder: (context, index) {
                          var e = approvedDriverListModel!.body!.driverapprovedvendorList![index];
                          return Card(
                            child: ListTile(
                              leading:  CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage('${e.profilePic}'),
                              ),
                              title:  Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${e.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                              ),
                              subtitle:  Text(
                                '${e.contact}',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 17),
                              ),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: (){Get.to(DriverDetailedScreen(driverDetails: e));},
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
          Get.to(AddDrivers());
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
