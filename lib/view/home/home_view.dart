import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/view/active_cabs.dart';
import 'package:viswa_cab_vendor_app/view/blocked%20cabs.dart';
import 'package:viswa_cab_vendor_app/view/home/cab_performance_screen.dart';
import 'package:viswa_cab_vendor_app/view/home/driver_performance_screen.dart';
import 'package:viswa_cab_vendor_app/view/inactive_cabs.dart';
import 'package:viswa_cab_vendor_app/view/my_earings_screen.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Dashboard',
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoCard(
                    iconData: Icons.location_on,
                    no: 2,
                    ontap: () {
                      Get.to(
                        const ActiveCabs(),
                      );
                    },
                    text: 'Active Cabs',
                    topColor: Colors.green,
                    iconColor: Colors.green,
                  ),
                  _infoCard(
                    iconData: Icons.car_repair,
                    no: 2,
                    ontap: () {
                      Get.to(
                        const InactiveCabs(),
                      );
                    },
                    text: 'InActive Cabs',
                    topColor: Colors.amber,
                    iconColor: Colors.amber,
                  ),
                  _infoCard(
                    iconData: Icons.block,
                    no: 3,
                    ontap: () {
                      Get.to(
                        const BlockedCabs(),
                      );
                    },
                    text: 'Blocked Cabs',
                    topColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Collection",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "\u{20B9} 61.08",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "01 Jul 2022",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Net Earning \u{20B9} 54.06",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "\u{20B9} 61.08",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Cash",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            width: 1,
                            height: 40,
                          ),
                          Column(
                            children: [
                              const Text(
                                "\u{20B9} 61.08",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Digital Payments",
                                textScaleFactor: Get.textScaleFactor,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            width: 1,
                            height: 40,
                          ),
                          Column(
                            children: const [
                              Text(
                                "\u{20B9} 61.08",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Discount",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (() {
                          Get.to(const MyEarningsScreen());
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Net Earnings",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cab Performance",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const CabPerformanceScreen());
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) =>
                      _cabcard(
                    cabno: "TN38AS1111",
                    amount: "11806.83 ",
                    rating: "4.5",
                    rides: 8,
                    photo: 'car2.png',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Driver Performance",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const DriverPerformanceScreen());
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) =>
                      _drivercard(
                    drivername: 'Raja',
                    earning: '11806',
                    photo: 'driver.png',
                    rating: '4.5',
                    rides: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _infoCard({
  required int no,
  required IconData iconData,
  required Color iconColor,
  required String text,
  required Color topColor,
  required VoidCallback ontap,
}) {
  return InkWell(
    onTap: ontap,
    child: Card(
      child: SizedBox(
        width: Get.width * 0.27,
        height: Get.height * 0.10,
        child: Column(children: [
          Divider(
            height: 5,
            color: topColor,
            thickness: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  no.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Icon(
                iconData,
                color: iconColor,
              )
            ],
          ),
          Text(text)
        ]),
      ),
    ),
  );
}

Widget _cabcard({
  required String photo,
  required String cabno,
  required String amount,
  required String rating,
  required int rides,
}) {
  return Card(
    child: SizedBox(
      width: Get.width * 0.50,
      height: Get.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: Image.asset(
                    'assets/images/$photo',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      cabno,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\u{20B9}$amount",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "Rides:$rides",
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget _drivercard({
  required String drivername,
  required String earning,
  required String photo,
  required String rating,
  required int rides,
}) {
  return Card(
    child: SizedBox(
      width: Get.width * 0.50,
      height: Get.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Image.asset(
                    'assets/images/$photo',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      drivername,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\u{20B9}$earning",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "Rides:$rides",
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
