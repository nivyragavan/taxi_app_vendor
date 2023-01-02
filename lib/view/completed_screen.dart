import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Completed Ride'),
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
              'Invoice Details',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueGreen),
            ),
            const SizedBox(height: 10),
            buildInvoiceDetailsCard()
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

  buildInvoiceDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Base Fare', style: TextStyle(fontSize: 17)),
                Text('1305 RS', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 5),
            const Text('80 kms free',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Fare for Remaining km', style: TextStyle(fontSize: 17)),
                Text('100 RS', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 5),
            const Text('20 kms * 11.00 (charged only if travelled)',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Convenience Fee', style: TextStyle(fontSize: 17)),
                Text('5 RS', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Taxes & Fees', style: TextStyle(fontSize: 17)),
                Text('100 RS', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Driver Allowance',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('0 RS',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Taxes',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('100 RS',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
