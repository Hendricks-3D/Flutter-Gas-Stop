import 'package:GasStop/models/driver.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:firebase_core/firebase_core.dart';

class DriverAuthService {
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  //Urls urls = new Urls();
  String token = ''; //the token will be updated on registration and sign up
  final FirebaseAuth _firebaseAuth;

  DriverAuthService(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

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
  Future<String?> signInDriver(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print('sign in complete');
      return "signed in";
    } on FirebaseAuthException catch (err) {
      return err.message;
    }
  } //end of sign in

/**
 * Method that register a new driver on firebase autheneication  db
 * then sends the driver data to firestore 
 */
  Future<String?> registerNewDriver(String email, String password) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => (value) => {print(value)});

      return "signed in";
    } on FirebaseAuthException catch (err) {
      return err.message;
    }
  } //end of register

} //End AuthService
