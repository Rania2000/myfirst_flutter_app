import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/client.dart';
import 'package:signup/models/livreur.dart';
import 'package:signup/shared/sharedPrefValues.dart';

/*****get all livreurs *******/

class ClientServices {
  // static Future<List<Client>> getListAllClient() async {
  //   var response;
  //   Dio dio = new Dio();
  //   final livreur = <Livreur>[];
  //   dio.options.headers['Authorization'] = 'Bearer ';
  //   response = await dio.get(baseUrl + 'livreur/');
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print(data);
  //     for (var item in data) {
  //       livreur.add(Livreur.fromJson(item));
  //     }
  //   }
  //   return livreur.toList();
  // }

  /*****get specific commande with id *******/

  static Future<Client> getspecificClient() async {
    var response;
    Dio dio = new Dio();
    var livreur;
    var userId = await getUserInfoSharedPref('id');
    var token = await getUserInfoSharedPref("token");
    dio.options.headers['Authorization'] = 'Bearer $token';
    response = await dio.get(baseUrl + 'clients/$userId');

    if (response.statusCode == 200) {
      print(response);
      final data = jsonDecode(response.toString());
      //print(data);
      livreur = Client.fromJson(data);
    }
    return livreur;
  }
}
