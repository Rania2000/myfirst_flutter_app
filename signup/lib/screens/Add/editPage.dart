// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:signup/components/InputWrapper.dart';

import '../../constants.dart';
import 'Header.dart';

// ignore: use_key_in_widget_constructors
class EditScreen extends StatefulWidget {
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.7],
              colors: [kPrimaryLightColor, ment]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: lightbleu,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: InputWrapper(),
            )),
          ],
        ),
      ),
    );
  }
}
