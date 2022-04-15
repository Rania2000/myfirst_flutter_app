import 'package:flutter/material.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';

class CommandeComponent extends StatefulWidget {
  final Commande commande;

  const CommandeComponent({Key? key, required this.commande}) : super(key: key);

  @override
  State<CommandeComponent> createState() => _CommandeComponentState();
}

class _CommandeComponentState extends State<CommandeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 0, top: 5),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food.jpg"))),
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
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.commande.article,
                      style: TextStyle(
                        //height: 1.171875,
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.commande.adrDepart +
                          'à' +
                          widget.commande.adrArrive,
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
                          widget.commande.numCommande,
                          style: TextStyle(
                              //height: 1.171875,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
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
  }
}
