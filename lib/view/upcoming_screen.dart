import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Upcoming Ride'),
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
              'Address Details',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueGreen),
            ),
            const SizedBox(height: 10),
            buildAddressDetails(),
            const SizedBox(height: 20),
            Text(
              'Trip Estimation Details',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blueGreen),
            ),
            const SizedBox(height: 10),
            buildTravelDetails()
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
            Text('Pickup: Coimbatore',
                style: TextStyle(fontSize: 17)), // pickup location
            SizedBox(height: 10),
            Text('Drop: Kerala',
                style: TextStyle(fontSize: 17)) // drop location
          ],
        ),
      ),
    );
  }

  buildAddressDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Address',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text('Pick Up : ',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('Feb 13 2022 ',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('05:00 PM',
                    style: TextStyle(fontSize: 17, color: Colors.black54))
              ],
            ),
            const SizedBox(height: 20),
            const Text('Place',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  buildTravelDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Leave On',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('25,mar, 12:45 PM', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Return By',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('27,mar, 11:00 PM', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Trip Duration',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('2 Days', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Trip kms',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('350 kms', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Fare',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('1305 RS', style: TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
