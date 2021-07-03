import 'package:GasStop/Helper/apiUrls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GasStationService {
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  // ignore: non_constant_identifier_names
  APIUrls URLS = new APIUrls();
  String? token = '';
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late String? id;

  //GasStationService(this._firebaseAuth);

  //Get All Gas Stations
  getAllGasStation() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      print(URLS.getAllGasStationsUrl);
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
    }
  }
}
