// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:signup/components/expandable_widget.dart';
import 'package:signup/components/rounded_button.dart';
import 'package:signup/constants.dart';
import 'package:signup/models/commande.dart';
import 'package:signup/screens/forU/forU_screen.dart';

class DetailsPage extends StatefulWidget {
  final Commande commande;
  DetailsPage({Key? key, required this.commande}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
var coordinates;
List<Marker> allMarkers = [];
late BitmapDescriptor customIcon;
GoogleMapController? _controller;
String? _mapStyle;

bool show = false;
  getCoordinates(var query) async {
    var addresses = [];
    var first;
    addresses = await Geocoder.local.findAddressesFromQuery(query);
    first = await addresses.first;
    coordinates = await first.coordinates;
    print("${first.countryName} : ${first.coordinates},${first.featureName}");
    setState(() {
      show = true;
    });
    return coordinates;
  }

void setCustomMapPin() async {
  customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/image/icon/marker.png');
}

setMarker(query) async {
  Coordinates coordinates = await getCoordinates(query);
  allMarkers.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
      markerId: MarkerId(widget.commande.adrDepart),
      draggable: false,
      infoWindow: InfoWindow(
          title: widget.commande.titre, snippet: widget.commande.adrDepart),
      position: LatLng(coordinates.latitude, coordinates.longitude)));
}
void _onMapCreated(GoogleMapController controller) {
  _controller = controller;
}

@override
  void initState() {
    // TODO: implement initState
  getCoordinates(widget.commande.adrDepart);
  setCustomMapPin();
  setMarker(widget.commande.adrDepart);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                color: Colors.grey,
                width: double.maxFinite,
                height: 350,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          coordinates.latitude, coordinates.longitude),
                      zoom: 16.0),

                  // markers: markers,
                  onTap: (pos) {
                    print(pos);
                    Marker m = Marker(
                        markerId: MarkerId('1'),
                        icon: customIcon,
                        position: pos);
                    setState(() {
                      allMarkers.add(m);
                    });
                  },
                  markers: Set.from(allMarkers),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                    _controller!.setMapStyle(_mapStyle);
                  },
                ),
                // child: Image.asset(
                //   "assets/images/map.jpg",
                //   fit: BoxFit.cover,
                // ),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/images/map.jpg"))),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                height: 500,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.commande.titre,
                      maxLines: 1,
                      style: TextStyle(
                        //height: 1.171875,
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.commande.adrDepart,
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 14,
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
                              size: 18,
                            ),
                            Text(widget.commande.adrArrive,
                                style: TextStyle(
                                    //height: 1.171875,
                                    fontSize: 14))
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: kPrimaryColor,
                              size: 18,
                            ),
                            Text(" 17pm",
                                style: TextStyle(
                                    //height: 1.171875,
                                    fontSize: 14)),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          '${widget.commande.prix}DT',
                          style: TextStyle(
                              //height: 1.171875,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              color: kPrimaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Text(
                      'Adresse de depart: ${widget.commande.adrDepart} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      "Adresse d'arrivé:${widget.commande.adrArrive}",
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      'Caracteristiques : ${widget.commande.caracters} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      'Type vehicule : ${widget.commande.typeVehicule} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    Text(
                      'type commande : ${widget.commande.typeCommande} ',
                      style: TextStyle(
                          //height: 1.171875,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                          color: myGrey),
                    ),
                    SingleChildScrollView(
                      child: Text(
                        'Description: ${widget.commande.caracters}',
                        style: TextStyle(
                            //height: 1.171875,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.25,
                            color: myGrey),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: RoundedButton(
                          text: "Demande de Livrer ",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForUScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
