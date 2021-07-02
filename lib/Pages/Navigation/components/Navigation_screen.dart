/*
Stateful widget templete.
Makes its easier to convert XD UI to stateful widgets
*/

import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      /*routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },*/
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Navigation page'),
    );
  }
}
