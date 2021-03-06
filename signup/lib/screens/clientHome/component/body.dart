// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/screens/Home/component/commande-item.dart';
import 'package:signup/services/commande_service.dart';

//import 'package:signup/screens/Login/components/background.dart';

// ignore: use_key_in_widget_constructors
class Body extends StatefulWidget {
 final bool isClient;
 Body({Key? key, required this.isClient}) : super(key: key);
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
    CommandeServices.getListAllOrders().then((res) {
      // i added "token" as variable
      setState(() {
        listCommandes = res;
      });
    });
    setState(() {
      isInCall = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    commadeCalls();
    super.initState();
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  commadeCalls();
                },
                child: Text(
                  "Mes Livraisons",
                  style: TextStyle(
                    //height: 1.171875,
                    fontSize: 34.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 41, 35, 92),
                  ),
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
                      text: 'D??J?? AFFECT??',
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
                          itemCount: listCommandes.length,
                          itemBuilder: (context, index) {
                            return CommandeComponent(
                                commande: listCommandes[index]);
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
                                commande: listCommandes[index]);
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
                                commande: listCommandes[index]);
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
