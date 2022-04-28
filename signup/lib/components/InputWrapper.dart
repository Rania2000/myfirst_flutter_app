// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/services/commande_service.dart';

import 'InputField.dart';

class InputWrapper extends StatefulWidget {
  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  bool isInCall = false;
  String dropdownValue = 'Alimentaire';
  final List<String> typeC = [
    'Alimentaire',
    'Médicament',
    'Fourniture',
    'Cosmétique',
    'Equipements Informatiques',
    'Déménagement',
    'Autres'
  ];
  TextEditingController commandeController = TextEditingController();
  TextEditingController departController = TextEditingController();
  TextEditingController arriveController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        color: lightbleu,
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey))),
                    child: TextField(
                      controller: commandeController,
                      decoration: InputDecoration(
                          hintText: "Entrer votre commande",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: lightbleu,
                        border: const Border(
                            bottom: const BorderSide(color: Colors.grey))),
                    child: TextField(
                      controller: departController,
                      decoration: InputDecoration(
                          hintText: "point de départ",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: lightbleu,
                        border: const Border(
                            bottom: const BorderSide(color: Colors.grey))),
                    child: TextField(
                      controller: arriveController,
                      decoration: InputDecoration(
                          hintText: "point d'arrivé",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Column(
                    children: [
                      Text(_dateTime == null
                          ? 'Nothing has been picked yet'
                          : _dateTime.toString()),
                      //Text('choisir une date de livraison'),
                      SizedBox(height: 5),
                      RaisedButton(
                        child: Text('Pick a date'),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  // ignore: prefer_if_null_operators, unnecessary_null_comparison
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2023))
                              .then((date) {
                            setState(() {
                              _dateTime = date!;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: lightbleu,
                        border: const Border(
                            bottom: const BorderSide(color: Colors.grey))),
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          hintText: "Prix",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Center(
                      child: DropdownButtonFormField(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    elevation: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: typeC.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: lightbleu,
                        border: const Border(
                            bottom: const BorderSide(color: Colors.grey))),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "delais de livraison",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: lightbleu,
                        border: const Border(
                            bottom: const BorderSide(color: Colors.grey))),
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                          hintText: "ajouter un commentaire",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "si vous avez terminer veuillez cliquer sur ajouter",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(
              text: "Ajouter ",
              press: () {
                _addCommande();
              },
            ),
          ],
        ),
      ),
    );
  }

  _addCommande() async {
    var rng = Random();

    setState(() {
      isInCall = false;
    });
    var numCommande = rng.nextInt(10000000);
    Commande commande = Commande(
        '0',
        'C${numCommande}',
        commandeController.text,
        dropdownValue,
        departController.text,
        arriveController.text,
        detailsController.text,
        '623c3c61ff083e1ae4e42e85',
        '22-02-2022',
        'encours',
        'voiture');

    CommandeServices.addCommande(commande).then((value) {
      print(value);
      if (value == 200) {
        Fluttertoast.showToast(
            msg: 'added succesfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'error occured',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });

    setState(() {
      isInCall = true;
    });
  }
}
