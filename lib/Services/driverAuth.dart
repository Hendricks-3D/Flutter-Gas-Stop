import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:gas_stop/Models/driver.dart';
import 'package:gas_stop/models/urls.dart';

class DriverAuthService {
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  //Urls urls = new Urls();
  String token = ''; //the token will be updated on registration and sign up
  FirebaseAuth auth = FirebaseAuth.instance; //firenase auth instance

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
  signInWithEmailPassword(Driver driver) async {
    try {
      // UserCredential userCredential =
      await auth.signInWithEmailAndPassword(
          email: driver.email, password: driver.email);

      this.token = await auth.currentUser!
          .getIdToken(); //Future string so the await keywork is necessary
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  } //end of sign in

/**
 * Method that register a new driver on firebase autheneication  db
 * then sends the driver data to firestore c
 */
  registerNewDriver(Driver driver) async {
    try {
      //UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(
          email: driver.email, password: driver.password);

      //update token
      this.token = await auth.currentUser!
          .getIdToken(); //Future string so the await keywork is necessary
      if (this.token != '') {
        this.addNewDriver(driver, token);
      } else {
        Fluttertoast.showToast(
            msg: 'user token empty',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  } //end of register

} //End AuthService
