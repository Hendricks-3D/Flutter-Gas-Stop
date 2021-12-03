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
  late Station _cheapStation = new Station(
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
  //List<Station> _nearestStation = []; //List.filled(3, 0, growable: true);
  late Station _nearestStation = new Station(
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
  String? selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      //Drop Down list
      DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        iconSize: 40.0,
        style: TextStyle(color: customColors.mainOrange),
        onChanged: (String? newValue) async {
          setState(() {
            this.selectedOption = newValue;
            print(this.selectedOption);
          });

          try {
            switch (newValue) {
              case 'Diesel':
                var station;
                //Get Diesel  data
                Future.delayed(
                    const Duration(seconds: 1),
                    () async => {
                          station =
                              (await GasStationService.getLowestDiesel())!,
                          setState(() {
                            this._cheapStation = station;
                          }),
                          print('Home Screen: line 61  ${station.name}')
                        });

                //Get the Nearest Station
                this.getNearestGasStation();

                break;

              case 'USLD':
                var station;
                //Get USLD Data
                Future.delayed(
                    const Duration(seconds: 1),
                    () async => {
                          station = (await GasStationService.getLowestUSLD())!,
                          setState(() {
                            this._cheapStation = station;
                          }),
                          print('Home Screen: line 81  ${station.name}')
                        });
                //Get the Nearest Station
                this.getNearestGasStation();
                break;

              case 'Premium':
                var station;
                //Get cheapest premium gas Station
                Future.delayed(
                    const Duration(seconds: 1),
                    () async => {
                          station =
                              (await GasStationService.getLowestPremium())!,
                          setState(() {
                            this._cheapStation = station;
                          }),
                          print('Home Screen: line 120  ${station?.name}')
                        });

                //Get nearest premium gas Station
                this.getNearestGasStation();

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

      HomeCardViewPage(this._nearestStation, selectedOption),
      SizedBox(height: 20.0, width: 20.0),
      Text('Cheapest gas stations near you'),
      SizedBox(height: 10.0),

      HomeCardViewPage(this._cheapStation, selectedOption),
    ]);
  }

  getNearestGasStation() {
    var nearestStation;
    List allGasStations = [1];
    //Get nearest premium gas Station
    Future.delayed(
        const Duration(seconds: 1),
        () async => {
              print('line 127 ${await GasStationService.getAllGasStation()}'),
              allGasStations =
                  (await GasStationService.getAllGasStation()) as List<Station>,
              nearestStation = this
                  .gasStationService
                  .getListOfClosestGasStation(allGasStations),
              setState(() => {this._nearestStation = nearestStation[0]}),
              print('Home line 135 ${nearestStation[0].name}')
            });
  }
}
/**
 * Current Issues:
 * I need to find a way  to get the lowest and nearest Gas Station
 * to fill the variables to prevent the index range error.
 * 
 */