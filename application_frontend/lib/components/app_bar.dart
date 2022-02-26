import 'package:flutter/material.dart';
import 'package:application_frontend/utils/constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required String this.title}) : super(key: key);

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: magenta, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(color: magenta),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
