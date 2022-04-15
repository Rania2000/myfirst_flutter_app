import 'package:signup/models/commande.dart';

class Client {
  final id;
  final String firstname;
  final String lastname;
  final String adress;
  final String email;
  final String password;
  final String status;
  final String phone;
  final String cin;
  final order_list; // to ask about the type if i add commande as a type

  Client(this.id, this.firstname, this.lastname, this.adress, this.status,
      this.email, this.password, this.phone, this.cin, this.order_list);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'firstname': firstname,
      'lastname': lastname,
      'adress': adress,
      'email': email,
      'password': password,
      'phone': phone,
      'status': status,
      'cin': cin,
      'order_list': {},
    };
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      json['_id'].toString(),
      json['firstname'].toString(),
      json['lastname'].toString(),
      json['adress'].toString(),
      json['email'].toString(),
      json['password'].toString(),
      json['status'].toString(),
      json['phone'].toString(),
      json['cin'].toString(),
      json['order_list']['_id'].toString(),
    );
  }
}
