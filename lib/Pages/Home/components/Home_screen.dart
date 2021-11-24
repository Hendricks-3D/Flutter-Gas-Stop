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
  Station _station = new Station(
      telephone: '',
      email: '',
      ratings: '',
      address: '',
      airPump: '',
      latitude: '',
      reviewsAmount: '',
      id: '',
      premium: '',
      diesel: '',
      openTime: '',
      name: '',
      password: '',
      closeTime: '',
      longitude: '',
      ulsd: '',
      regular: '');
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
            switch (newValue) {
              case 'Diesel':
                var station;
                //Get Diesel  data
                //this.station = GasStationService.getLowestDiesel() as Station;
                Future.delayed(
                    const Duration(seconds: 1),
                    () async => {
                          station =
                              (await GasStationService.getLowestDiesel())!,
                          setState(() {
                            this._station = station;
                          }),
                          print('Home Screen: line 61  ${station.name}')
                        });

                break;

              case 'USLD':
                var station;
                //Get USLD Data
                // this.station = GasStationService.getLowestUSLD as Station;

                Future.delayed(
                    const Duration(seconds: 1),
                    () async => {
                          station = (await GasStationService.getLowestUSLD())!,
                          setState(() {
                            this._station = station;
                          }),
                          print('Home Screen: line 81  ${station.name}')
                        });

                break;

              case 'Premium':
                var station;
                //  var station = await GasStationService.getLowestPremium();
                Future.delayed(
                    const Duration(seconds: 1),
                    () async => {
                          station =
                              (await GasStationService.getLowestPremium())!,
                          setState(() {
                            this._station = station;
                          }),
                          print('Home Screen: line 97  ${station?.name}')
                        });

                break;
              default:
            }
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

      HomeCardViewPage(this._station),
    ]);
  }
}
