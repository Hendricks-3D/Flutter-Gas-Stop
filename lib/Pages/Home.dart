import 'package:flutter/material.dart';

//import 'package:adobe_xd/adobe_xd.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      /*routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },*/
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home page'),
    );
  }
}
