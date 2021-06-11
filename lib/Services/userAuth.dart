import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gas_stop/Models/user.dart';
import 'package:gas_stop/models/urls.dart';

class UserAuthService {
  Dio dio = new Dio(); //Dio is a package that can be use to do HTTP request
  Urls urls = new Urls();

  //Method that will get the new
  addNewUser(User user) async {
    try {
      return await dio.post(this.urls.addUserUrl,
          data: {
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "carType": user.carType
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
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

}
