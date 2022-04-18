// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OrderModify extends StatelessWidget {
  final String commandeID;
  bool get isEditing => commandeID != null;

  OrderModify({required this.commandeID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit' : 'Creation commande')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: ' title'),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(hintText: 'type Commande '),
            ),
            Container(height: 16),
            TextField(
              decoration: InputDecoration(hintText: 'caracteristiques '),
            ),
            Container(height: 16),
            TextField(
              decoration: InputDecoration(hintText: 'type vehicule '),
            ),
            Container(height: 16),
            TextField(
              decoration: InputDecoration(hintText: 'adresse depart '),
            ),
            Container(height: 16),
            TextField(
              decoration: InputDecoration(hintText: 'adresse arrivé '),
            ),
            Container(height: 16),
            TextField(
              decoration: InputDecoration(hintText: 'date , heure'),
            ),
            Container(
                height:
                    16), //// status , numcommande customerId sont automatique
            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
