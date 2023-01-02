

import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Cancelled Ride'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'User Details',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueGreen),
            ),
            const SizedBox(height: 10),
            buildUserDetailsCard(),
            const SizedBox(height: 20),
            Text(
              'Driver Details',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueGreen),
            ),
            const SizedBox(height: 10),
            buildDriverDetailsCard(),
            const SizedBox(height: 20),
            Text(
              'Reason',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueGreen),
            ),
            const SizedBox(height: 10),
            buildReasonCard()
          ],
        ),
      ),
    );
  }

  buildUserDetailsCard() {
    return Card(
      child: ListTile(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Nivy',
            style: TextStyle(fontSize: 17),
          ), //user name
        ),
        subtitle: const Text('ABCDE12345',
            style: TextStyle(fontSize: 17)), // booking id
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text('Pickup: Saibaba Colony',
                style: TextStyle(fontSize: 17)), // pickup location
            SizedBox(height: 10),
            Text('Drop: Gandhipuram',
                style: TextStyle(fontSize: 17)) // drop location
          ],
        ),
      ),
    );
  }

  buildDriverDetailsCard() {
    return Card(
      child: ListTile(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Vijay',
            style: TextStyle(fontSize: 17),
          ), // driver name
        ),
        subtitle: const Text('ABCDE12345',
            style: TextStyle(fontSize: 17)), //booking id
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text('9876543210', style: TextStyle(fontSize: 17)), //contact number
            SizedBox(height: 10),
            Text('TN232343HJBFJD',
                style: TextStyle(fontSize: 17)) // license number
          ],
        ),
      ),
    );
  }

  buildReasonCard() {
    return Card(
      child: ListTile(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Cancelled By :',
            style: TextStyle(fontSize: 17),
          ),
        ),
        subtitle: const Text('Reason :', style: TextStyle(fontSize: 17)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text('User', style: TextStyle(fontSize: 17)),
            SizedBox(height: 10),
            Text('Wrong Time', style: TextStyle(fontSize: 17))
          ],
        ),
      ),
    );
  }
}
