import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:signup/models/commande.dart';

class CommandeServices {
  static Future<List<Commande>> getListAllOrders(token) async {
    var response;
    Dio dio = new Dio();
    final commandes = <Commande>[];
    dio.options.headers['Authorization'] = 'Bearer $token';
    response = await dio.get('http://localhost:5000/commande/');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      for (var item in data) {
        commandes.add(Commande.fromJson(item));
      }
    }
    return commandes.toList();
  }
}
