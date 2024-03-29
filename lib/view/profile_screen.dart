import 'package:flutter/material.dart';
import 'package:viswa_cab_vendor_app/models/profile_view_model.dart';
import 'package:viswa_cab_vendor_app/service/api_service.dart';
import 'package:viswa_cab_vendor_app/widgets/appbar.dart';
import 'package:viswa_cab_vendor_app/widgets/drawer_widget.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileViewModel? profileViewModel;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    profileViewModel = await ApiService().profileView();
    if(profileViewModel != null){
      setState(() {
        isLoading = true;
      });
      setState(() {
        profileViewModel = profileViewModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Profile'),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(child: buildProfile()),
    );
  }

  buildProfile() {
    var e = profileViewModel!.body![0];
    return Padding(
      padding: const EdgeInsets.all(10),
      child:isLoading == false ? Center(child: CircularProgressIndicator(color: blueGreen,),) : Column(
        children: [
          ListTile(
            title:
            Text('Name', style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${e.name}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
          ListTile(
            title: Text('Phone Number',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
            trailing: Text('${e.contact}',
                style: TextStyle(fontSize: 18, letterSpacing: 2)),
          ),
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
            title: Text('Pan Card',
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
            title: Text('Passbook',
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
            title: Text('Rental Agreement 1',
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
            title: Text('Rental Agreement 2',
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
