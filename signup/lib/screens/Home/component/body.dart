// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:signup/Details/components/body.dart';
import 'package:signup/Details/detailsScreen.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/screens/Home/component/commande-item.dart';
import 'package:signup/services/commande_service.dart';

//import 'package:signup/screens/Login/components/background.dart';

// ignore: use_key_in_widget_constructors
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  bool isInCall = false;
  var token;
  List<Commande> listCommandes = [];
  commadeCalls() {
    setState(() {
      isInCall = true;
    });
    CommandeServices.getListAllOrders(token).then((res) {    // i added "token" as variable 
      setState(() {
        listCommandes = res;
      });
    });
    setState(() {
      isInCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height,
        color: lightbleu,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //SizedBox(height: 20),
              Text(
                "Mes Livraison",
                style: TextStyle(
                  //height: 1.171875,
                  fontSize: 34.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 41, 35, 92),
                ),
              ),
              SizedBox(height: 10),
//tabbar
              Container(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 5, right: 5),
                  controller: _tabController,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    //height: 1.171875,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: iris,
                  tabs: [
                    Tab(
                      text: "TOUT",
                    ),
                    Tab(
                      text: "EN ATTENTE",
                    ),
                    Tab(
                      text: 'DÉJÀ AFFECTÉ',
                    )
                  ],
                ),
              ),
              Container(
                  height: 600,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        height: 600,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 0, top: 5),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return DetailsScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/fleur.jpg"))),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Bouquet de fleur, Fleuriste Manzah5",
                                              maxLines: 1,
                                              style: TextStyle(
                                                //height: 1.171875,
                                                fontSize: 14.0,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'de Manzah5 à Tunis ',
                                              style: TextStyle(
                                                  //height: 1.171875,
                                                  fontSize: 12,
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
                                                      size: 16,
                                                    ),
                                                    Text(" Manzah5",
                                                        style: TextStyle(
                                                            //height: 1.171875,
                                                            fontSize: 12))
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.timer,
                                                      color: kPrimaryColor,
                                                      size: 16,
                                                    ),
                                                    Text(" 17pm",
                                                        style: TextStyle(
                                                            //height: 1.171875,
                                                            fontSize: 12)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  " 4dt",
                                                  style: TextStyle(
                                                      //height: 1.171875,
                                                      fontSize: 24,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: kPrimaryColor),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 600,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: listCommandes.length,
                          itemBuilder: (context, index) {
                            return CommandeComponent(
                              commande: listCommandes[index],
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 600,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 0, top: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/food.jpg"))),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "4 Burguers -restaurant foody  ",
                                              style: TextStyle(
                                                //height: 1.171875,
                                                fontSize: 14.0,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'de Aouina à LACII ',
                                              style: TextStyle(
                                                  //height: 1.171875,
                                                  fontSize: 12,
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
                                                      size: 16,
                                                    ),
                                                    Text("Aouina",
                                                        style: TextStyle(
                                                            //height: 1.171875,
                                                            fontSize: 12)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.timer,
                                                      color: kPrimaryColor,
                                                      size: 16,
                                                    ),
                                                    Text(" 1pm",
                                                        style: TextStyle(
                                                            //height: 1.171875,
                                                            fontSize: 12)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  " 5dt",
                                                  style: TextStyle(
                                                      //height: 1.171875,
                                                      fontSize: 24,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: kPrimaryColor),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
