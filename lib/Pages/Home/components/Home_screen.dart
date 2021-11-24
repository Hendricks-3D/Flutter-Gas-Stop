import 'package:GasStop/Helper/CustomColors.dart';
import 'package:GasStop/Pages/Home/components/Home_cardView.dart';
import 'package:GasStop/Services/gasStationService.dart';
import 'package:GasStop/models/GasStation_Models/single_station_response.dart';
import 'package:GasStop/models/Station.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomColors customColors = new CustomColors();
  String dropdownValue = 'USLD';
  GasStationService gasStationService = new GasStationService();
  SingleStationResponse singleStationResponse = new SingleStationResponse();
  Station station = new Station(
      telephone: '',
      email: '',
      ratings: '',
      address: '',
      airPump: '',
      latitude: '',
      reviewsAmount: '',
      id: '',
      premium: 0.0,
      diesel: 0.0,
      openTime: '',
      name: '',
      password: '',
      closeTime: '',
      longitude: '',
      ulsd: 0.0,
      regular: 0.0);
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
        onChanged: (String? newValue) async {
          try {
            setState(() {
              switch (newValue) {
                case 'Diesel':
                  //Get Diesel  data

                  Future.delayed(
                      const Duration(seconds: 1),
                      () async => {
                            this.station =
                                (await GasStationService.getLowestDiesel())!
                          });

                  break;

                case 'USLD':
                  //Get USLD Data
                  Future.delayed(
                      const Duration(seconds: 1),
                      () async => {
                            this.station =
                                (await GasStationService.getLowestUSLD())!
                          });
                  break;

                case 'Premium':
                  Future.delayed(
                      const Duration(seconds: 1),
                      () async => {
                            this.station =
                                (await GasStationService.getLowestPremium())!
                          });
                  break;
                default:
              }
            });
          } catch (err) {
            print(err);
          }

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
      //HomeCardViewPage(),
      SizedBox(height: 20.0, width: 20.0),
      Text('Cheapest gas stations near you'),
      SizedBox(height: 10.0),

      HomeCardViewPage(this.station),
    ]);
  }
}
