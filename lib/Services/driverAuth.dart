import 'dart:async';

import 'package:GasStop/models/driver.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

//https://flutter.dev/docs/cookbook/persistence/key-value
//import 'package:firebase_core/firebase_core.dart';

class DriverAuthService {
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  //Urls urls = new Urls();
  String token = ''; //the token will be updated on registration and sign up
  final FirebaseAuth _firebaseAuth;
  late String? id;

  DriverAuthService(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //Method that will get the new
  addNewDriver(Driver user, token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      return await dio.post(
        'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
            '/addUser/' +
            user.id,
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

  //Method that will get the new
  getCurrentDriver(token, uid) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    print(uid);
    try {
      return await dio
          .get(
            'https://us-central1-gasstop-a7ea1.cloudfunctions.net/app' +
                '/getCurrentUser/' +
                uid,
          )
          .then((val) => print(val.data));
    } on DioError catch (err) {
      Fluttertoast.showToast(
          msg: 'Error getting user',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } //add new user

/*
 * Method that sign in user with email andn password
 * then get the token 
 */
  Future<String?> signInDriver(String email, String password) async {
    late Driver driver = new Driver();
    final prefs = await SharedPreferences.getInstance();
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                this.id = value.user?.uid,
                prefs.setString(
                    'uid',
                    value.user!
                        .uid), //! tells the compilier the expression cannot be null
                this._firebaseAuth.currentUser?.getIdToken().then((token) => {
                      this.getCurrentDriver(token, value.user?.uid),
                      prefs.setString('token', token)
                    }),

                //  print(value.user?.uid)
              });
      Fluttertoast.showToast(
          msg: 'Welcome',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);

      return this.id;
    } on FirebaseAuthException catch (err) {
      Fluttertoast.showToast(
          msg: 'Please check email and password.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return err.message;
    }
  } //end of sign in

/*
 * Method that register a new driver on firebase autheneication  db
 * then sends the driver data to firestore 
 */
  Future<String?> registerNewDriver(Driver driver) async {
    try {
      print(driver.email + ' ' + driver.password);
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: driver.email, password: driver.password)
          .then((value) => {
                driver.id = value.user!.uid,
                //Send user data to the API
                this._firebaseAuth.currentUser?.getIdToken().then((token) =>
                    {this.token = token, this.addNewDriver(driver, token)})
              });

      //Print toast message to user
      Fluttertoast.showToast(
          msg: 'Registration completed.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
      return "registered";
    } on FirebaseAuthException catch (err) {
      Fluttertoast.showToast(
          msg: 'Registration failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return err.message;
    }
  } //end of register

//Sign out user
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
} //End AuthService
