import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup/constants.dart';
import 'package:signup/shared/sharedPrefValues.dart';

//import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  Dio dio = new Dio();

/////////////// Login fournisseur  ///////////////////////////////
  loginFr(email, password) async {
    try {
      var response = await dio.post(baseUrl + 'clients/login',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(response.headers['Authorization'].toString());
      var token = response.data['token'];
      var refreshToken = response.headers['Authorization'];
      var userId = response.data['id'];
      var role = response.data['role'];
      saveAccessTokenSharedPref(token, refreshToken.toString(), userId, role);
      return response;
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
      var response = await dio.post(baseUrl + 'livreur/login',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(response.headers['Authorization'].toString());
      var token = response.data['token'];
      var refreshToken = response.headers['Authorization'];
      var userId = response.data['id'];
      var role = response.data['role'];
      saveAccessTokenSharedPref(token, refreshToken.toString(), userId, role);
      return response;
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
      var response = await dio.post(baseUrl + 'clients/',
          data: {
            "email": email,
            "adress": adress,
            "firstname": firstname,
            "lastname": lastname,
            "password": password,
            "status": status,
            "phone": phone,
            "cin": cin,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(response.data);
      return response;
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
      var response = await dio.post(baseUrl + 'livreur/',
          data: {
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "password": password,
            "status": status,
            "adress": adress,
            "phone": phone,
            "permis": permis,
            "voiture": voiture,
            "cin": cin
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(response.data);
      return response;
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

///////////////// new login

/*Future<Livreur> login(String email, String password) async {
    final api = 'http://localhost:5000/livreur/login';
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return Livreur(email: email, token: body['token']);
    } else {
      return null;
    }
  }

Future<Livreur> getliv() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return Livreur(email: email, token: token);
    } else {
      return null;
    }
  }
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return true;
  }


  */

}
