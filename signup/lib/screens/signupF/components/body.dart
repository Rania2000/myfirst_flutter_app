// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:signup/screens/Login/login_screen.dart';

import 'package:signup/screens/Signup/components/background.dart';
import 'package:signup/screens/Signup/components/or_divider.dart';
import 'package:signup/screens/Signup/components/social_icon.dart';
import 'package:signup/screens/login_success/login_sucess_screen.dart';
import 'package:signup/screens/login_successF/login_sucess_screen.dart';
import 'package:signup/services/authservice.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropdownValue = 'Personne Physique';
  final List<String> type = ['Personne Physique', 'Personne Morale'];
  var firstname, lastname, adress, email, password, status, phone, cin;
  final _ConName = TextEditingController();
  final _ConPren = TextEditingController();
  final _ConEmail = TextEditingController();
  final _ConAdress = TextEditingController();
  final _ConCIN = TextEditingController();
  final _Contlf = TextEditingController();
  final _ConPass = TextEditingController();
  var _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.08),
            Text(
              "Nouveau Client ",
              style: TextStyle(
                height: 1.171875,
                fontSize: 34.0,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 41, 35, 92),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_1n2cvwnt.json',
                height: size.height * 0.35,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: const EdgeInsets.fromLTRB(60.0, 10.0, 60, 10.0),
              child: Column(
                children: [
                  TextFormField(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _ConName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Nom',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,

                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        firstname = val;
                      }),

                  TextFormField(
                      controller: _ConPren,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Prénom',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        lastname = val;
                      }),
                  TextFormField(
                      controller: _ConEmail,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        email = val;
                      }),
                  TextFormField(
                      controller: _ConAdress,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Adresse',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        adress = val;
                      }),
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
                    items: type.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  )),
/*value: 'hahaha',
                    items: accountType.map((accountType) {
                      return DropdownMenuItem(
                        value: accountType,
                        child: Text(accountType),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _currentAccountType = val;
                      });*/
                  TextFormField(
                      controller: _ConCIN,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'CIN / Immatricule ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        cin = val;
                      }),
                  TextFormField(
                      controller: _Contlf,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Numéro tlf',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        phone = val;
                      }),
                  TextField(
                      controller: _ConPass,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          labelText: 'Mot De Passe  ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kPrimaryLightColor,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor))),
                      onChanged: (val) {
                        password = val;
                      }),
                  // ignore: prefer_const_literals_to_create_immutables
                ],
              ),
            ),
            RoundedButton(
              text: "SignUp",
              press: () {
                AuthService()
                    .AddClient(
                        _ConName.text,
                        _ConPren.text,
                        _ConAdress.text,
                        _ConEmail.text,
                        _ConPass.text,
                        dropdownValue,
                        _Contlf.text,
                        _ConCIN.text)
                    .then((val) {
                  Fluttertoast.showToast(
                      msg: 'user created successfully',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/fb1.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/tweet.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You have an Account ? ",
                  //' dont have account',
                  style: const TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
