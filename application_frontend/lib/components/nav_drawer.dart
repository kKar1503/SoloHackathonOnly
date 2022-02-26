import 'package:application_frontend/screens/home.dart';
import 'package:application_frontend/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:application_frontend/utils/constants.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Drawer(
        backgroundColor: magentaWithOpacity,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.

          children: [
            SizedBox(
              height: 48,
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: offWhite,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: offWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Home();
                }));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: offWhite,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          color: offWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
