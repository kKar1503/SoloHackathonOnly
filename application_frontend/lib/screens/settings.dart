import 'package:application_frontend/components/app_bar.dart';
import 'package:application_frontend/components/nav_drawer.dart';
import 'package:application_frontend/screens/user_auth.dart';
import 'package:application_frontend/utils/auth.dart';
import 'package:application_frontend/utils/constants.dart';
import 'package:application_frontend/utils/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  final String? token;
  Settings({Key? key, this.token}) : super(key: key);

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      token: json['id'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: CustomAppBar(
        title: "Settings",
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    SettingHeader(
                      headerName: "Account",
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => EditProfile(),
                        //       settings: RouteSettings(arguments: routeArgs)),
                        // );
                      },
                      child: SettingOption(
                        optionName: "Edit Profile",
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: SettingOption(
                        optionName: "Notification schedule",
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //SettingHeader(headerName: "Notifications"),
                    // SettingToggleOption(
                    //   optionName: "Reminders",
                    // ),

                    SettingHeader(
                      headerName: "Help",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // if (await canLaunch(tosURL)) {
                        //   await launch(tosURL);
                        // }
                      },
                      child: SettingOption(
                        optionName: "Terms & Services",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // if (await canLaunch(privacyPolicyURL)) {
                        //   await launch(privacyPolicyURL);
                        // }
                      },
                      child: SettingOption(
                        optionName: "Privacy",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: SettingOption(
                        optionName: "Report a Problem",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: SettingOption(
                        optionName: "Help Center",
                      ),
                    ),

                    SettingHeader(headerName: ""),
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 15),
                      child: GestureDetector(
                        onTap: () async {
                          await Auth().logout();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => UserAuth()));
                        },
                        child: Text(
                          "Logout from this account",
                          style: TextStyle(fontSize: 15, color: blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 15),
                      child: GestureDetector(
                        onTap: () async {
                          await HttpService().linkTelegram();
                          Clipboard.setData(ClipboardData(text: "$token"));
                          Fluttertoast.showToast(msg: "Copied Token");
                          await launch("https://t.me/soloboloboom_bot");
                        },
                        child: Row(
                          children: [
                            Text(
                              "Link to Telegram",
                              style: TextStyle(fontSize: 15, color: blue),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.telegram,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingToggleOption extends StatefulWidget {
  final String optionName;
  const SettingToggleOption({required this.optionName});

  @override
  _SettingToggleOptionState createState() => _SettingToggleOptionState();
}

class _SettingToggleOptionState extends State<SettingToggleOption> {
  late bool _isToggled;
  @override
  void initState() {
    _isToggled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, left: 0, right: 0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Text(
                "${widget.optionName}",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            CupertinoSwitch(
                activeColor: green,
                value: _isToggled,
                onChanged: (bool isToggle) {
                  setState(() {
                    _isToggled = isToggle;
                  });
                })
          ],
        ),
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  final String optionName;
  const SettingOption({required this.optionName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, left: 0, right: 0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Text(
                optionName,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 22, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}

class SettingHeader extends StatelessWidget {
  final String headerName;
  const SettingHeader({required this.headerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          headerName,
          style: TextStyle(
              fontSize: 13, fontWeight: ksemiBold, color: Colors.black),
        ),
      ),
    );
  }
}
