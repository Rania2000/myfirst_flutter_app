// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:signup/components/rounded_button.dart';
//import 'package:signup/components/already_have_an_account_acheck.dart';
import 'package:signup/constants.dart';
import 'package:signup/screens/Login/login_screen.dart';
import 'package:signup/screens/LoginLiv/login_screen.dart';
//import 'package:signup/screens/Login/login_screen.dart';
import 'package:signup/screens/Signup/components/background.dart';
import 'package:signup/screens/Signup/components/or_divider.dart';
import 'package:signup/screens/Signup/components/social_icon.dart';
import 'package:signup/screens/login_success/login_sucess_screen.dart';
import 'package:signup/services/authservice.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _ConName = TextEditingController();
  final _ConPren = TextEditingController();
  final _ConEmail = TextEditingController();
  final _ConAdress = TextEditingController();
  final _ConCIN = TextEditingController();
  final _Contlf = TextEditingController();
  final _ConPass = TextEditingController();
  var _passwordVisible = false;
  Object? arguments;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dropdownValue = 'Livreur Autonome';
    String dropdownValue2 = 'voiture';
    String dropdownValue3 = 'type A';

    final List<String> typeLiv = ['Livreur Autonome', 'Société Livraison '];
    final List<String> typepermis = ['type A', 'type B', 'type C'];
    final List<String> typeVehicule = [
      'voiture',
      'camion',
      'moto',
      'byciclette',
      'pas vehicule'
    ];

    var firstname,
        lastname,
        email,
        password,
        status,
        adress,
        phone,
        permis,
        voiture,
        cin;
    bool? remember = false;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.08),
            Text(
              "Nouveau livreur ",
              style: TextStyle(
                height: 1.171875,
                fontSize: 34.0,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 41, 35, 92),
              ),
            ),
            Center(
              child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_yqhwn4pd.json',
                height: size.height * 0.35,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: const EdgeInsets.fromLTRB(60.0, 10.0, 60, 10.0),
              child: Column(
                children: [
                  TextFormField(
                      controller: _ConName,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Nom',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                    items: typeLiv.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  )),

                  TextFormField(
                      controller: _ConCIN,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'CIN',
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
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                  Center(
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
                    items: typeVehicule.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  )),
                  Center(
                      child: DropdownButtonFormField(
                    value: dropdownValue3,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    elevation: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue3 = newValue!;
                      });
                    },
                    items: typepermis.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  )),

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
              text: "Sign Up",
              press: () {
                AuthService()
                    .AddLivreur(
                        _ConName.text,
                        _ConPren.text,
                        _ConEmail.text,
                        _ConPass.text,
                        dropdownValue,
                        _ConAdress.text,
                        _Contlf.text,
                        dropdownValue3,
                        dropdownValue2,
                        _ConCIN.text)
                    .then((val) {
                  Fluttertoast.showToast(
                      msg: 'user created successfully',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginLivScreen();
                      },
                    ),
                  );
                });
              },
            ),
            SizedBox(height: size.height * 0.02),
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
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an Account ? ",
                  //' dont have account',
                  style: const TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginLivScreen();
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
