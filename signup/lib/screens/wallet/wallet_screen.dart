// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:signup/constants.dart';
import 'package:signup/screens/wallet/components/body.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbleu,
      body: Body(),
    );
  }
}
