import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

/////////////// Login fournisseur  ///////////////////////////////
  loginFr(email, password) async {
    try {
      return await dio.post('http://localhost:5000/clients/login',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
/////////////// Login Livreurr  ///////////////////////////////////////////////

  loginLiv(email, password) async {
    try {
      return await dio.post('http://localhost:5000/livreur/login',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

///////////////////// SignUp fournisseur ///////////////////////

  AddClient(
      firstname, lastname, adress, email, password, status, phone, cin) async {
    try {
      return await dio.post('http://localhost:5000/clients/',
          data: {
            "firstname": firstname,
            "lastname": lastname,
            "password": password,
            "status": status,
            "phone": phone,
            "cin": cin,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

/////////////////// signup livreur /////////////////
  AddLivreur(firstname, lastname, email, password, status, adress, phone,
      permis, voiture, cin) async {
    try {
      return await dio.post('http://localhost:5000/livreur/',
          data: {
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "password": password,
            "status": status,
            "adress": adress,
            "permis": permis,
            "phone": phone,
            "cin": cin,
            "voiture": voiture
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
