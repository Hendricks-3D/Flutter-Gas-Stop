import 'dart:io';
import 'dart:math';

import 'package:GasStop/Helper/apiUrls.dart';
import 'package:GasStop/Helper/handleGeolocation.dart';
import 'package:GasStop/models/GasStation_Models/gasStation.dart';
import 'package:GasStop/models/Station.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GasStationService {
  static var client = http.Client();
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  // ignore: non_constant_identifier_names
  APIUrls URLS = new APIUrls();
  String? token = '';
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late String? id;

  //GasStationService(this._firebaseAuth);

  //Get All Gas Stations
  Future<Response?> getAllGasStation() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      //  print(URLS.getAllGasStationsUrl);
      return await dio.get(
          'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app/allGasStations');
    } on DioError catch (err) {
      Fluttertoast.showToast(
          msg: err.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return null;
    }
  }

  static Future<Station?> getLowestRegular() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await client.get(
      Uri.parse('https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestRegularPrice'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('Station Service: line 60 $jsonString');
      return stationFromJson(jsonString);
    } else {
      Fluttertoast.showToast(
          msg: 'please check your internet',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  static Future<Station?> getLowestPremium() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await client.get(
      Uri.parse('https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestPremiumPrice'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      //  print('Station Service: line 86 $jsonString');
      return stationFromJson(jsonString);
    } else {
      Fluttertoast.showToast(
          msg: 'please check your internet',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  static Future<Station?> getLowestDiesel() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await client.get(
      Uri.parse('https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestDieselPrice'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // print('Station Service: line 111 $jsonString');
      return stationFromJson(jsonString);
    } else {
      Fluttertoast.showToast(
          msg: 'please check your internet',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  static Future<Station?> getLowestUSLD() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await client.get(
      Uri.parse('https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
          '/getLowestULSDPrice'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // print('Station Service: line 137 $jsonString');
      return stationFromJson(jsonString);
    } else {
      Fluttertoast.showToast(
          msg: 'please check your internet',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }
  // Future<Station?> getLowestRegular() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token');
  //   Response response;
  //   dio.options.headers['Authorization'] = 'Bearer $token';

  //   try {
  //     //  print(URLS.getAllGasStationsUrl);
  //     response = await dio.get(
  //         'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
  //             '/getLowestRegularPrice');

  //     return stationFromJson(response.data);
  //   } on DioError catch (err) {
  //     Fluttertoast.showToast(
  //         msg: err.message,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);

  //     return null;
  //   }
  // }

  //Method that will get the closest gas station based on user current location
  //CLosest distance will be 2.5km
  // ignore: non_constant_identifier_names
  List<GasStation> getListOfClosestGasStation(allGasStationsList) {
    List<GasStation> closestGasStations = [];
    var len = allGasStationsList.length;
    var R = 6378.137; // Radius of earth in KM
    var location = new HandleGeolocation();

    for (var i = 0; i < len; i++) {
      var dLat = location.getLatitude() * pi / 180 -
          int.parse(allGasStationsList[i].latitude) * pi / 180;
      var dLon = location.getLongitude() * pi / 180 -
          int.parse(allGasStationsList[i].longitude) * pi / 180;
      var a = sin(dLat / 2) * sin(dLat / 2) +
          cos(location.getLatitude() / 180) *
              cos(int.parse(allGasStationsList[i].latitude) * pi / 180) *
              sin(dLon / 2) *
              sin(dLon / 2);
      var c = 2 * atan2(sqrt(a), sqrt(1 - a));
      var distance = R * c;
      //the formula isnt accurate when compare to google maps but this 40 represents 700 meters
      //therefore 40*6 4200 = 4.2km
      if (distance < 240) {
        closestGasStations.add(allGasStationsList[i]);

        print('closest gas stations below');
        print(closestGasStations);
      }
    } //End for loop
    return closestGasStations;
  }
}
