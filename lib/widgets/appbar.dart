import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viswa_cab_vendor_app/constants/colors.dart';
import 'package:viswa_cab_vendor_app/view/profile_screen.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.title, this.centertitle = true})
      : super(key: key);
  final String title;
  final bool centertitle;
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      centerTitle: centertitle,
      automaticallyImplyLeading: true,
      backgroundColor: blueGreen,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(onPressed: (){Get.to(ProfileScreen());}, icon: Icon(Icons.account_circle_rounded,size: 35,)),
        )
      ],
    );
  }
}
