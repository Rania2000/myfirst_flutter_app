import 'package:flutter/material.dart';
import 'package:signup/constants.dart';

import 'package:grouped_list/grouped_list.dart';

class NotifScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NotifScreen({Key? key}) : super(key: key);

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  List _elements = [
    {'name': 'LIVREUR1', 'group': '25/07/2022'},
    {'name': 'LIVREUR2', 'group': '24/08/2022'},
    {'name': 'LIVREUR3', 'group': '5/26/2022'},
    {'name': 'LIVREUR4', 'group': '24/07/2022'},
    {'name': 'LIVREURtest', 'group': '25/07/2021'},
    {'name': 'LIVREUR3', 'group': '12/07/2021'},
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightbleu,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: myGrey,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
              height: 1.171875,
              fontSize: 14.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
              color: myGrey),
        ),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: myGrey),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading:
                      Icon(Icons.account_circle, color: kPrimaryLightColor),
                  title: Text(
                    element['name'],
                    style: TextStyle(
                        height: 1.171875,
                        fontSize: 14.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.0,
                        color: myGrey),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: kPrimaryColor,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
