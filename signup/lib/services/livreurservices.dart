import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/livreur.dart';
import 'package:signup/shared/sharedPrefValues.dart';

/*****get all livreurs *******/

class LivreurServices {
  static Future<List<Livreur>> getListAlllivreur() async {
    var response;
    Dio dio = new Dio();
    final livreur = <Livreur>[];
    dio.options.headers['Authorization'] = 'Bearer ';
    response = await dio.get(baseUrl + 'livreur/');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      for (var item in data) {
        livreur.add(Livreur.fromJson(item));
      }
    }
    return livreur.toList();
  }

  /*****get specific commande with id *******/

  static Future<Livreur> getspecificlivreur(livreurId) async {
    var response;
    Dio dio = new Dio();
    var livreur;
    var userId=await getUserInfoSharedPref('id');
    var token = await getUserInfoSharedPref("token");
    dio.options.headers['Authorization'] = 'Bearer $token';
    response = await dio.get(baseUrl + 'livreur/$userId');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      livreur= Livreur.fromJson(data);
    }
    return livreur;
  }
}
