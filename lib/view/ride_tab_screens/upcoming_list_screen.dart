

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/view/upcoming_screen.dart';

class UpcomingListScreen extends StatelessWidget {
  const UpcomingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildUpcomingList(),
    );
  }

  buildUpcomingList() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
              child: GestureDetector(
                onTap: () {
                  Get.to(const UpcomingScreen());
                },
                child: ListTile(
                  title: const Text('31-05-2022'), //ride date
                  subtitle: const Text('ABCDE12345'), //ride booking id
                  trailing: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Upcoming', style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
              ),
            ));
  }
}
