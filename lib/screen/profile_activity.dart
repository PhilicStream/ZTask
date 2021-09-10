// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProfileActivity extends StatefulWidget {
  static String id = "profile Activity";
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  dynamic imagefile;
  final ImagePicker picker = ImagePicker();
  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      imagefile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.indigo[900],
                    backgroundImage: imagefile == null
                        ? NetworkImage(
                            args['images'],
                          )
                        : FileImage(File(imagefile.path)) as ImageProvider),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) => Container(
                            height: 100.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Choose Profile photo",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.deepPurple,
                                        ),
                                        icon: Icon(Icons.camera),
                                        onPressed: () {
                                          takePhoto(ImageSource.camera);

                                          Navigator.pop(context);
                                        },
                                        label: Text("Camera"),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.deepPurple,
                                        ),
                                        icon: Icon(Icons.image),
                                        onPressed: () {
                                          takePhoto(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        label: Text("Gallery"),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                          radius: 18.0, child: Icon(Icons.camera_outlined)),
                    ))
              ]),
              SizedBox(
                height: 10.0,
              ),
              Text(
                args['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                args['email'],
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
