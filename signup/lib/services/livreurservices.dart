import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LivService {
  Dio dio = new Dio();

//////////////////////// get info

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('http://localhost:5000/livreur/');
  }
}
