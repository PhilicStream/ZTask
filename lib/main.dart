import 'package:flutter/material.dart';
import 'package:ztask/home.dart';
import 'package:ztask/login.dart';
import 'package:ztask/screen/profile_activity.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TASK',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Login.id,
        routes: {
          ProfileActivity.id: (context) => ProfileActivity(),
          Login.id: (context) => Login(),
          Home.id: (context) => Home(),
        });
  }
}
