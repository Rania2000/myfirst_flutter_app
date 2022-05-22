import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/services/Dio_service.dart';
import 'package:signup/shared/sharedPrefValues.dart';

class CommandeServices {
  static Future<List<Commande>> getListAllOrders() async {
    var token;
    var response;
    //Dio Interceptor
    var dio = DioUtil.getInstance();
    //Dio dio = new Dio();
    final commandes = <Commande>[];
    token = getUserInfoSharedPref('token');
    print(token);
    dio.options.headers['Authorization'] = 'Bearer $token';
    response = await dio.get(baseUrl+'commande/');
   // print(response);
    if (response.statusCode == 200) {
      log(response.toString());
      //print(response);
      var data = jsonDecode(response.toString()) ;
      //print(data);//  print(data);
      for (var item in data['orders']) {
        commandes.add(Commande.fromJson(item));
      }
    }
    //print(commandes);
    return commandes.toList();
  }


  static Future<int> addCommande(Commande commande) async {
    var url;
    var response;
    var dio =  DioUtil.getInstance();
    var token = await getUserInfoSharedPref("token");
    dio.options.headers["Authorization"] = "Bearer " + token;

    await dio.post(baseUrl+'commande/add',data:commande.toJson()).then((value){
      print(value.data);
      response= value.statusCode;
    });
    return response;
  }

  static Future<int> editCommande(Commande commande,idCommande) async {
    var url;
    var response;
    var dio = DioUtil.getInstance();
   // await getUserInfoSharedPref("token").then((token) async {
      print(commande.toJson());
      print('${baseUrl}/commande/$idCommande');
      return  await dio.patch('${baseUrl}commande/$idCommande',data:commande.toJson()).then((value){
        print(value.data);
        print(value.statusCode);

        response= value.statusCode;
        return response;

      });
  //  });
    return response;

  }
}
