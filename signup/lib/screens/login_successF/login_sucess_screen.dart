// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:signup/screens/login_successF/components/body.dart';

class LoginSuccessScreenF extends StatelessWidget {
  final bool isClient;
  LoginSuccessScreenF({required this.isClient});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(isClient: true,),
    );
  }
}
