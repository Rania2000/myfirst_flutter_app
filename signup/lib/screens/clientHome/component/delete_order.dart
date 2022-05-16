// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OrderDelete extends StatefulWidget {
  @override
  State<OrderDelete> createState() => _OrderDeleteState();
}

class _OrderDeleteState extends State<OrderDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alerte'),
      content: Text('vous etes sure , voulez-vous supprimer cette commande ?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Oui'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('Non'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
