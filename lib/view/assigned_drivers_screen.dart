import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/service/api_service.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/customtext.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

import '../models/assigned_drivers_list_model.dart';

class AssignedDriversScreen extends StatefulWidget {
  const AssignedDriversScreen({Key? key}) : super(key: key);

  @override
  State<AssignedDriversScreen> createState() => _AssignedDriversScreenState();
}

class _AssignedDriversScreenState extends State<AssignedDriversScreen> {
  AssignedDriversListModel? assignedDriversListModel;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    assignedDriversListModel = await ApiService().assignedDriversList();
    if (assignedDriversListModel != null) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        assignedDriversListModel = assignedDriversListModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Assigned Drivers'),
      drawer: DrawerWidget(),
      body: buildListViewBuilder(),
    );
  }

  buildListViewBuilder() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: isLoading == false
          ? Center(
              child: CircularProgressIndicator(
                color: blueGreen,
              ),
            )
          : assignedDriversListModel!.body!.assignList!.isEmpty
              ? Image.asset('assets/images/nodatafound.png')
              : ListView.separated(
                  itemBuilder: (context, index) {
                    var e = assignedDriversListModel!.body!.assignList![index];
                    return ListTile(
                      title: CustomText(text: '${e.car!.carNumber}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(text: '${e.driver!.name}'),
                          const SizedBox(height: 10),
                          CustomText(text: '${e.driver!.contact}')
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                  itemCount: assignedDriversListModel!.body!.assignList!.length),
    );
  }
}
