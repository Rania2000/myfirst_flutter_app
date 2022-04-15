import 'package:signup/models/commande.dart';

class Livreur {
  final id;
  final String firstname;
  final String lastname;
  final String adress;
  final String email;
  final String password;
  final String status;
  final String phone;
  final String cin;
  final panier; // to ask about the type if i add commande as a type
  final String permis;

  Livreur(
      this.id,
      this.firstname,
      this.lastname,
      this.adress,
      this.status,
      this.email,
      this.password,
      this.permis,
      this.phone,
      this.cin,
      this.panier);

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
      'permis': permis,
      'cin': cin,
      'panier': {},
    };
  }

  factory Livreur.fromJson(Map<String, dynamic> json) {
    return Livreur(
      json['_id'].toString(),
      json['firstname'].toString(),
      json['lastname'].toString(),
      json['adress'].toString(),
      json['email'].toString(),
      json['password'].toString(),
      json['status'].toString(),
      json['phone'].toString(),
      json['cin'].toString(),
      json['permis'].toString(),
      json['panier']['_id'].toString(),
    );
  }
}
