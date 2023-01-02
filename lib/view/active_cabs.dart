import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class ActiveCabs extends StatelessWidget {
  const ActiveCabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Active Cabs'),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView.builder(
            itemBuilder: (context, index) {
              return _activeCard(
                  photo: "assets/images/driver.png",
                  name: 'Raju',
                  phoneno: "9997788445",
                  licenseno: "TND122318SD",
                  status: "IDLE",
                  map: "assets/images/map.png",
                  basefare: "220",
                  addcharge: "100",
                  confee: "125",
                  gst: "120",
                  total: "500",
                  wallettotal: "1200",
                  walletspent: "250",
                  walletbalance: "950");
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
  required String basefare,
  required String addcharge,
  required String confee,
  required String gst,
  required String total,
  required String wallettotal,
  required String walletspent,
  required String walletbalance,
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
                      color: Colors.green, fontWeight: FontWeight.w500),
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
        const Cardtext(
          text: "Invoice",
        ),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("BaseFare"),
                  const Spacer(),
                  Text(basefare)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Additional charges"),
                  const Spacer(),
                  Text(addcharge)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Convenience fee"),
                  const Spacer(),
                  Text(confee)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [const Text("GST"), const Spacer(), Text(gst)],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [const Text("Total"), const Spacer(), Text(total)],
              ),
            ),
          ]),
        )),
        const Cardtext(
          text: "Wallet",
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Total"),
                      const Spacer(),
                      Text(wallettotal)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Spent"),
                      const Spacer(),
                      Text(walletspent)
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Balance"),
                      const Spacer(),
                      Text(walletbalance)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class Cardtext extends StatelessWidget {
  const Cardtext({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: blueGreen),
      ),
    );
  }
}
