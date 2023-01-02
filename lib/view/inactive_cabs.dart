import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/view/active_cabs.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class InactiveCabs extends StatelessWidget {
  const InactiveCabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Inactive Cabs'),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView.builder(
            itemBuilder: (context, index) {
              return _activeCard(
                photo: "assets/images/driver.png",
                name: 'Raju',
                phoneno: "9997788445",
                licenseno: "TND122318SD",
                status: "Offline",
                map: "assets/images/map.png",
              );
            },
            itemCount: 10,
          )),
    );
  }
}

Widget _activeCard({
  required String photo,
  required String name,
  required String phoneno,
  required String licenseno,
  required String status,
  required String map,
}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ListView(
      children: [
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(photo),
            ),
            title: Text(name),
            subtitle: Text(phoneno),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  licenseno,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  status,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        const Cardtext(text: "Location"),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: Get.height * 0.3,
              width: Get.width,
              child: Image.asset(
                map,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
