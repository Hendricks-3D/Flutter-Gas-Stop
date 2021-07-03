import 'package:GasStop/Helper/CustomColors.dart';
import 'package:GasStop/Pages/Home/components/Home_cardView.dart';
import 'package:GasStop/Services/gasStationService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomColors customColors = new CustomColors();
  String dropdownValue = 'USLD';
  GasStationService gasStationService = new GasStationService();
  @override
  Widget build(BuildContext context) {
    /*TODO: the home screen will get the gas station
            data then loop through it and render HomeCardviewPage
    */
    return ListView(children: <Widget>[
      //Drop Down list

      DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        iconSize: 40.0,
        style: TextStyle(color: customColors.mainOrange),
        onChanged: (String? newValue) {
          gasStationService.getAllGasStation().then((value) => print(value));
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['USLD', 'Diesel', 'Premium']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),

      ///------------
      SizedBox(width: 20.0),
      Text('Nearest gas station'),
      SizedBox(height: 10.0),
      HomeCardViewPage(),
      SizedBox(height: 20.0, width: 20.0),
      Text('Cheapest gas stations near you'),
      SizedBox(height: 10.0),
      HomeCardViewPage(),
    ]);
  }
}
