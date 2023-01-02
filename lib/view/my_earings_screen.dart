import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/customtext.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class MyEarningsScreen extends StatelessWidget {
  const MyEarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'My Earnings'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  TextField(
                    cursorColor: blueGreen,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueGreen, width: 2)),
                        hintText: "Vehicle number or date",
                        suffixIcon: Icon(Icons.search, color: blueGreen)),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: const CustomText(
                              text: "TN05RE1234",
                            ),
                            subtitle: const CustomText(
                              text: "5FQCWFX740WC",
                              fontsize: 15,
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CustomText(
                                  text: "\u{20B9}2656",
                                  fontsize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomText(
                                  text: "14-07-2022",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
