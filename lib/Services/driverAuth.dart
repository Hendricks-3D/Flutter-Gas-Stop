import 'package:GasStop/models/driver.dart';
import 'package:GasStop/models/payload.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:firebase_core/firebase_core.dart';

class DriverAuthService {
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  //Urls urls = new Urls();
  String token = ''; //the token will be updated on registration and sign up

  //Method that will get the new
  addNewDriver(Driver user, token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      return await dio.post(
        'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' + '/addUser',
        data: {
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "carType": user.carType
        },
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );
    } on DioError catch (err) {
      Fluttertoast.showToast(
          msg: err.response!.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } //add new user

/**
 * Method that sign in user with email andn password
 * then get the token 
 */
  signInDriver(Driver driver) async {} //end of sign in

/**
 * Method that register a new driver on firebase autheneication  db
 * then sends the driver data to firestore 
 */
  registerNewDriver(Driver driver) async {
    Payload payload = new Payload();
    try {
      return await dio.post(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB8HDirLfsQQLCdglfrzukd8bv_CSuHHr0',
          data: {
            "email": driver.email,
            "password": driver.password,
            "returnSecureToken": true
          }).then((value) => print(value));
    } on DioError catch (err) {
      Fluttertoast.showToast(
          msg: err.response!.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } //end of register

  String getToken() {
    return 'token: ' + token;
  }
} //End AuthService
