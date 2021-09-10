import 'package:flutter/material.dart';
import 'package:ztask/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  static const String id = "login";
  static String mail = "login@test.com";
  static String password = "zucol4321";
  static bool valid = false;
  static List images = [];
  static List name = [];
  static List email = [];

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  login() async {
    final response = await http.post(
        Uri.parse('http://homstel.appexperts.net/public/api/demoLogin'),
        body: {"email_id": "login@test.com", "password": "zucol4321"});
    dynamic data = json.decode(response.body);
    print(data);
  }

  createAlbum() async {
    final response = await http.post(
        Uri.parse('http://homstel.appexperts.net/public/api/demoHome'),
        body: {"branch_id": "3"});
    dynamic data = json.decode(response.body);
    for (var item in data['sliders']) {
      Login.images.add(item['image']);
    }
    for (var item in data['profiles']) {
      Login.email.add(item['mail']);
    }
    for (var item in data['profiles']) {
      Login.name.add(item['name']);
    }
    // for (var i = 0; i < name.length; i++) {
    //   print(name[i]);
    //   print(email[i]);
    //   print(images[i]);
    // }
    // print(data["sliders"]);
    // print(data['profiles'][0]['mail']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(right: 50.0),
                  child: Image(image: AssetImage("assets/Ztask.png")),
                ),
              ),
              //email field:
              TextField(
                  controller: _emailController,
                  // ..text = RegistrationScreen.mainUser.email,
                  keyboardType: TextInputType.emailAddress,
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    labelText: 'Email',
                  )),
              SizedBox(height: 20),
              //password field:
              TextField(
                  controller: _otpController,
                  // ..text = RegistrationScreen.mainUser.email,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    labelText: 'Password',
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    if (_emailController.text == Login.mail &&
                        _otpController.text == Login.password) {
                      await createAlbum();
                      setState(() {
                        Login.valid = true;
                      });
                      final snackbar =
                          SnackBar(content: Text('Successfully Logged In'));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      Navigator.popAndPushNamed(context, Home.id);
                    } else {
                      final snackbar =
                          SnackBar(content: Text('Incorrect Details'));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                  child: Text("Login", style: TextStyle(fontSize: 20)))
            ],
          )),
    );
  }
}
