import 'package:GasStop/Helper/CustomColors.dart';
import 'package:GasStop/Pages/Home/components/Home_cardView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomColors customColors = new CustomColors();
  @override
  Widget build(BuildContext context) {
    /*TODO: the home screen will get the gas station
            data then loop through it and render HomeCardviewPage
    */
    return ListView(children: <Widget>[
      Text('Nearest gas station'),
      SizedBox(height: 10.0),
      HomeCardViewPage(),
      SizedBox(height: 20.0),
      Text('Cheapest gas stations near you'),
      SizedBox(height: 10.0),
      HomeCardViewPage(),
    ]);
  }
}
