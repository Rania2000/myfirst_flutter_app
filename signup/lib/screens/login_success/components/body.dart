// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';

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
            "assets/images/loginSuccess.png",
            height: size.height * 0.6, //40%
            width: double.infinity,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Bienvenue ',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: -2.171875,
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
                'sur notre réseau',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: -0.756,
                  fontSize: 34.0,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 41, 35, 92),
                ),
              )),
          SizedBox(
            height: size.height * 0.15,
          ),
          SizedBox(
            width: size.width * 0.6,
            child: RoundedButton(
              text: "Back to home",
              press: () {},
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
