/*
Stateful widget templete.
Makes its easier to convert XD UI to stateful widgets
*/

import 'package:GasStop/models/driver.dart';
import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class SignupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Driver driver = new Driver();
  var token;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
