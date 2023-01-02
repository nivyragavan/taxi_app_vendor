import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/view/cancelled_screen.dart';

class CancelledListScreen extends StatelessWidget {
  const CancelledListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCancelledList(),
    );
  }

  buildCancelledList() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
              child: GestureDetector(
                onTap: () {
                  Get.to(const CancelledScreen());
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
                      child: Text('Cancelled', style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
              ),
            ));
  }
}
