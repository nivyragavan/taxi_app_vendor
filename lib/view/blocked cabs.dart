
import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';

class BlockedCabs extends StatelessWidget {
  const BlockedCabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Blocked Cabs',
      ),
      body: buildBlockedCabs(),
    );
  }

  buildBlockedCabs() {
    return SizedBox(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('TN01AB9999'),

              //vehicle number
              subtitle: Text('Payment overdue'),

              //reason
              trailing: Text('31-05-2022'),

              //date of journey
            );
          }),
    );
  }
}
