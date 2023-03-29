import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';


class IndividualCabPerformanceScreen extends StatelessWidget {
  const IndividualCabPerformanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'TN 01 AB 1234'),
      body: buildCabPerformance(),
    );
  }

  buildCabPerformance() {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Text('Nivy'),
            ),
            subtitle: const Text('Pickup Location',style: TextStyle(color: Colors.black),),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('\u{20B9} 3000'),

                //amount received
                SizedBox(height: 10),
                Text('Drop Location'),
              ],
            ),
          );
        });
  }
}
