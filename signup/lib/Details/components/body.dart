// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:signup/components/expandable_widget.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/screens/forU/forU_screen.dart';

class DetailsPage extends StatefulWidget {
  final Commande commande;
  DetailsPage({Key? key, required this.commande}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                color: Colors.grey,
                width: double.maxFinite,
                height: 350,
                child: Image.asset(
                  "assets/images/map.jpg",
                  fit: BoxFit.cover,
                ),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/images/map.jpg"))),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                height: 500,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.commande.titre,
                      maxLines: 1,
                      style: TextStyle(
                        //height: 1.171875,
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.commande.adrDepart,
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: myGrey),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.place_rounded,
                              color: kPrimaryColor,
                              size: 18,
                            ),
                            Text(widget.commande.adrArrive,
                                style: TextStyle(
                                    //height: 1.171875,
                                    fontSize: 14))
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: kPrimaryColor,
                              size: 18,
                            ),
                            Text(" 17pm",
                                style: TextStyle(
                                    //height: 1.171875,
                                    fontSize: 14)),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          widget.commande.numCommande,
                          style: TextStyle(
                              //height: 1.171875,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Text(
                      'Adresse de depart: ${widget.commande.adrDepart} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      "Adresse d'arrivé:${widget.commande.adrArrive}",
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      'Caracteristiques : ${widget.commande.caracters} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      'Type vehicule : ${widget.commande.typeVehicule} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      'Description: ${widget.commande.typeCommande} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              " Voici un bel assemblage de freesias, colorés et parfumés, spécialement confectionné par votre fleuriste Foliflora Le parfum de ces fleurs est très semblable à celui du jasmin, et il est d ailleurs de plus en plus souvent utilisé comme note de cœur par les créateurs de parfums !Ces magnifiques freesias proviennent d'un producteur local. Ils sont livrés en bouton, gage d'une extrême fraîcheur, pour que vous puissiez les voir s’épanouir pleinement chez vous, et puissiez en profiter bien plus longtemps !Des fleurs à offrir sans modération !"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: RoundedButton(
                          text: "Demande de Livrer ",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForUScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
