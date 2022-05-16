// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, deprecated_member_use, non_constant_identifier_names
//import 'package:flutter/scheduler.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:flutter/material.dart';
import 'package:signup/main_screen_nav.dart';
import 'package:signup/main_screen_navF.dart';
import 'package:signup/screens/Home/home_screen.dart';
import 'package:signup/screens/Login/login_screen.dart';

import 'package:signup/screens/Welcome/components/background.dart';
import 'package:signup/screens/clientHome/home_screenClient.dart';
import 'package:signup/screens/users/sign1.dart';
import 'package:signup/screens/usersLogin/sign1.dart';
import 'package:signup/shared/sharedPrefValues.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  checkIfTokenExists() async {
    await getUserInfoSharedPref("token").then((token) async {
      if (token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreenF(isClient: true,),
            settings: const RouteSettings(name: "/mainPage"),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    checkIfTokenExists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations

    // ignore: sized_box_for_whitespace
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 10.0),
            Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.5,
            ),
            SizedBox(height: 15.0), // was 45.0

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 8.0),
              child: Text('Application de livraison collaboratif ',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 34.0,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 41, 35, 92),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 8.0),
              child: Text(
                'Nous rejoindre à notre reseau en tant que commerçant ou livreur',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.411764705882353,
                  fontSize: 17.0,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 70, 67, 98),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),

            RoundedButton(
              text: "Login",
              press: () {
                // ignore: unused_local_variable
                // SchedulerBinding.instance!.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return userLoginscreen();
                    },
                  ),
                );
                // });
              },
              key: null,
              color: kPrimaryColor,
            ),
            SizedBox(width: 20.0),
            RoundedButton(
              text: "Sign Up ",
              color: kPrimaryLightColor,
              textColor: Colors.grey.shade900,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return userscreen();
                    },
                  ),
                );
              },
              key: null,
            ),
          ],
        ),
      ),
    ));
  }
}
