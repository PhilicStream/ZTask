import 'package:flutter/material.dart';
import 'package:ztask/login.dart';
import 'package:ztask/screen/profile_activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  static const String id = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, Login.id);
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: Login.images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProfileActivity.id, arguments: {
                  "images": Login.images[index],
                  "name": Login.name[index],
                  "email": Login.email[index],
                });
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: prefer_const_constructors
                    Image(
                      image: NetworkImage(Login.images[index]),
                    ),
                    SizedBox(height: 10),
                    Text("\t\t${Login.name[index]}",
                        style: TextStyle(fontSize: 20)),
                    Text("\t\t${Login.email[index]}",
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
