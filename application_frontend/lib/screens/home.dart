import 'package:application_frontend/components/app_bar.dart';
import 'package:application_frontend/components/nav_drawer.dart';
import 'package:application_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
      ),
      drawer: NavDrawer(),
      backgroundColor: offWhite,
    );
  }
}
