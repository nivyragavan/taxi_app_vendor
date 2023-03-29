import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/models/approved_driver_list_model.dart';

class DriverDetailedScreen extends StatelessWidget {
  final DriverapprovedvendorList driverDetails;
  const DriverDetailedScreen({
    Key? key,
    required this.driverDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${driverDetails.name}',
          style: TextStyle(fontSize: 20, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: blueGreen,
      ),
      body: Column(
        children: [
          ListTile(
            title:
                Text('Name', style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${driverDetails.name}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
            title: Text('Phone Number',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${driverDetails.contact}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
            title: Text('District',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${driverDetails.district}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
            title: Text('License Number',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${driverDetails.licenseNumber}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
            title: Text('Expiry Date',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text(
                '${DateFormat('dd-MM-yyyy').format(driverDetails.expieryDate!)}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
              title: Text('Profile Photo',
                  style: TextStyle(fontSize: 18, letterSpacing: 2)),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        contentPadding: EdgeInsets.all(0),
                            children: [
                              Image.network(
                                  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                            ],
                          ));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(
                      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                ),
              )),
          ListTile(
              title: Text('Aadhaar Front',
                  style: TextStyle(fontSize: 18, letterSpacing: 2)),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        contentPadding: EdgeInsets.all(0),
                        children: [
                          Image.network(
                              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                        ],
                      ));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(
                      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                ),
              )),
          ListTile(
            title: Text('Aadhaar Back',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.all(0),
                      children: [
                        Image.network(
                            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                      ],
                    ));
              },
              child: Container(
                width: 50,
                height: 50,
                child: Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
              ),
            ),
          ),
          ListTile(
            title: Text('License Front',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.all(0),
                      children: [
                        Image.network(
                            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                      ],
                    ));
              },
              child: Container(
                width: 50,
                height: 50,
                child: Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
              ),
            ),
          ),
          ListTile(
            title: Text('License Back',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.all(0),
                      children: [
                        Image.network(
                            'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
                      ],
                    ));
              },
              child: Container(
                width: 50,
                height: 50,
                child: Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
