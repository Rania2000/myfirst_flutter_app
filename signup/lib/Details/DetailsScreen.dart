import 'package:flutter/material.dart';
import 'package:signup/Details/components/body.dart';
import 'package:signup/models/commande.dart';

class DetailsScreen extends StatelessWidget {
  final Commande commande;
  DetailsScreen({required this.commande});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsPage(
        commande: commande,
      ),
    );
  }
}
