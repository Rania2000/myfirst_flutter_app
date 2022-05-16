// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:signup/Details/detailsScreen.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:signup/screens/Home/home_screen.dart';
import 'package:signup/screens/clientHome/home_screenClient.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.5, 0.7],
              colors: [kPrimaryLightColor, light, ment])),
      child: Column(
        children: [
          Image.asset(
            "assets/images/done.png",
            height: size.height * 0.7, //40%
            width: double.infinity,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'La livraison est ',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: -4.171875,
                  fontSize: 34.0,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 41, 35, 92),
                ),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'pour vous !',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: -3.171875,
                  fontSize: 34.0,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 41, 35, 92),
                ),
              )),
          SizedBox(
            width: size.width * 0.6,
            child: RoundedButton(
              text: "Retour",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
