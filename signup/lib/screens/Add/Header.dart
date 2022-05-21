import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String commandeID;
  final bool isEditing;
  // bool get isEditing => commandeID != null;
  Header({required this.commandeID, required this.isEditing});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              widget.isEditing ? 'Edit' : "Ajouter une Commande",
              style: TextStyle(
                height: 1.411764705882353,
                fontSize: 24.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 70, 67, 98),

                /* letterSpacing: 0.0, */
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              widget.isEditing
                  ? "veuillez modifier les champs"
                  : "veuillez remplir les champs ",
              style: TextStyle(
                height: 1.411764705882353,
                fontSize: 18.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                color: Colors.white,

                /* letterSpacing: 0.0, */
              ),
            ),
          )
        ],
      ),
    );
  }
}
