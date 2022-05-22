// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/services/commande_service.dart';
import 'package:signup/shared/sharedPrefValues.dart';


class InputWrapper extends StatefulWidget {

  final commande;
  final bool isEditing;
  InputWrapper({required this.isEditing,this.commande});
  @override
  State<InputWrapper> createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  bool isInCall = false;
  String dropdownValue = 'Alimentaire';
  String dropdownValue2 = 'voiture';
  final List<String> typeV = [
    'voiture',
    'Moteur',
    'bicyclette',
    'camion',
    'Any'
  ];
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
  void initState() {
    // TODO: implement initState
    widget.isEditing?commandeController.text=widget.commande.titre:commentController.text='';
    widget.isEditing?departController.text=widget.commande.adrDepart:departController.text='';
    widget.isEditing?arriveController.text= widget.commande.adrArrive:arriveController.text='';
    widget.isEditing?priceController.text=widget.commande.prix:priceController.text='';
    widget.isEditing?commentController.text=widget.commande.code:commentController.text='';
    dropdownValue=widget.commande.typeCommande??'Alimentaire';
    dropdownValue2=widget.commande.typeVehicule??'voiture';

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
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
                          hintText: "Titre commande",
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
                      controller:arriveController,
                      decoration: InputDecoration(
                          hintText: "point d'arrivé",
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
                      controller: priceController,
                      decoration: InputDecoration(
                          hintText: "Prix",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: lightbleu,
                    ),
                    child: Center(
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
                  ),
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
                    decoration: BoxDecoration(
                      color: lightbleu,
                    ),
                    child: Row(
                      children: [
                        Text(
                            _dateTime == null
                                ? 'choisir une date de livraison'
                                : DateFormat.yMMMEd().format(_dateTime),
                            style: TextStyle(color: Colors.grey)),
                        //Text('choisir une date de livraison'),
                        SizedBox(width: 15),
                        RaisedButton(
                          color: kPrimaryLightColor,
                          textColor: Colors.white,
                          hoverColor: kPrimaryColor,
                          child: Text('Choisir Date'),
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    helpText: 'choisir une date de livraison',
                                    // ignore: prefer_if_null_operators, unnecessary_null_comparison
                                    initialDate: _dateTime == null
                                        ? DateTime.now()
                                        : _dateTime,
                                    // : DateTime.now(),
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: lightbleu,
                    ),
                    child: Center(
                        child: DropdownButtonFormField(
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      elevation: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: typeV.map((valueItem) {
                        return DropdownMenuItem<String>(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    )),
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
              text:widget.isEditing?"Modifier":"Ajouter ",
              press: () {
                widget.isEditing?_editList():_addCommande();
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
    var code = rng.nextInt(100000);
    var userId= await getUserInfoSharedPref('id');
    print(userId);
    print(_dateTime);
    Commande commande = Commande(
        '0',
        'L${numCommande}',
        commandeController.text,
        dropdownValue,
        departController.text,
        arriveController.text,
        commentController.text,
        //DateFormat.MEd().format(_dateTime),
        //'623c3c61ff083e1ae4e42e85',
        userId,
        '623da357b6f6d6d6932626b1',
        '2022-05-15T21:19:44.580Z',
        'encours',
        priceController.text,
        dropdownValue2,
        code.toString());

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

  _editList() async {
    setState(() {
      isInCall = false;
    });
    var userId= await getUserInfoSharedPref('id');
    print(widget.commande.id);
     Commande commande = Commande(
        widget.commande.id,
        widget.commande.numCommande,
        commandeController.text,
        dropdownValue,
        departController.text,
        arriveController.text,
        commentController.text,
        //DateFormat.MEd().format(_dateTime),
        //'623c3c61ff083e1ae4e42e85',
        userId,
        '',
        _dateTime.toString(),
        'encours',
        priceController.text,
        dropdownValue2,
        widget.commande.code);


    CommandeServices.editCommande(commande, widget.commande.id).then((value) {
      print(value);
      if (value == 200) {
        Fluttertoast.showToast(
            msg: 'commande modifiée avec sucées',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pop(context);
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
