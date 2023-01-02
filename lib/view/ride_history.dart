import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/ride_tab_screens/cancelled_list_screen.dart';
import 'package:viswa_cab_vendor_app/view/ride_tab_screens/completed_list_screen.dart';
import 'package:viswa_cab_vendor_app/view/ride_tab_screens/upcoming_list_screen.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

class RideHistory extends StatelessWidget {
  const RideHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppbar(),
        drawer: const DrawerWidget(),
        body: buildTabBarView(),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        "Ride History",
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: white),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: blueGreen,
      bottom: TabBar(
          labelColor: white,
          labelStyle:
              const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          indicatorColor: blueGreen,
          indicatorWeight: 5,
          unselectedLabelColor: white,
          unselectedLabelStyle:
              const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled')
          ]),
    );
  }

  buildTabBarView() {
    return const TabBarView(children: [
      UpcomingListScreen(),
      CompletedListScreen(),
      CancelledListScreen()
    ]);
  }
}
