// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:application_frontend/screens/home.dart';
import 'package:application_frontend/screens/settings.dart';
import 'package:application_frontend/screens/user_auth.dart';

import 'package:application_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final routes = {
    "/home": (context) => Home(),
    "/settings": (context) => Settings(),
    "/": (context) => UserAuth(),

    //"/fifth": (context) => SpeechToTextTest(question: "question")
    // Pholder(
    //     index:3,
    //   route: "fourth",
    // ),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        canvasColor: offWhite,
        fontFamily: "Inter",
        primarySwatch: Colors.blue,
      ),
      home: const UserAuth(),
    );
  }
}
