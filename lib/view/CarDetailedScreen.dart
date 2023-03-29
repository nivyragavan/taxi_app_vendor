import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/models/approved_car_list_model.dart';


class CarDetailedScreen extends StatelessWidget {

  final CarapprovedvendorList carDetails;

  const CarDetailedScreen({Key? key, required this.carDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${carDetails.carNumber}',
          style: TextStyle(fontSize: 20, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: blueGreen,
      ),
      body: Column(
        children: [
          ListTile(
            title:
            Text('Register Number', style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${carDetails.carNumber}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
            title: Text('Model',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${carDetails.model}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
              title: Text('Front Image',
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
              title: Text('Chassis Image',
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
            title: Text('RC Front',
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
            title: Text('RC Back',
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
            title: Text('Insurance',
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
            title: Text('FC Copy',
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
