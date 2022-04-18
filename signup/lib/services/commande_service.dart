import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/shared/sharedPrefValues.dart';

class CommandeServices {
  static Future<List<Commande>> getListAllOrders() async {
    var token;
    var response;
    Dio dio = new Dio();
    final commandes = <Commande>[];
    token = getUserInfoSharedPref('token');
    print(token);
    dio.options.headers['Authorization'] = 'Bearer $token';
    response = await dio.get('http://10.0.2.2:5000/commande/');

    if (response.statusCode == 200) {
      print(response);
      var data = jsonDecode(response.toString()) ;
      print(data);//  print(data);
      for (var item in data['orders']) {
        commandes.add(Commande.fromJson(item));
      }
    }
    print(commandes);
    return commandes.toList();
  }


  static Future<int> addCommande(Commande commande) async {
    var url;
    var response;
    var dio = new Dio();
    var token = await getUserInfoSharedPref("token");
    dio.options.headers["Authorization"] = "Bearer " + token;

    await dio.post('http://10.0.2.2:5000/commande/add',data:commande.toJson()).then((value){
      print(value.data);
      response= value.statusCode;
    });
    return response;
  }
}
