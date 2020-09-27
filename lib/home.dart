import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frens/agora/main.dart';
import 'package:frens/chatone.dart';
import 'package:frens/chattwo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MapType _currentMapType = MapType.normal;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAsset('images/marker.bmp');
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(40.749790, -73.989030);
    LatLng pinPosition2 = LatLng(40.660960, -73.966570);

    String positionOne = "Mikey";
    String positionTwo = "Anna";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor('#FF9671'),
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome",
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
        ),
      ),
      backgroundColor: Hexcolor('#FF9671'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.78,
                      child: GoogleMap(
                        initialCameraPosition: initialLocation,
                        mapType: _currentMapType,
                        myLocationEnabled: true,
                        markers: _markers,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                          setState(() {
                            _markers.add(Marker(
                                markerId: MarkerId("Mikey"),
                                position: pinPosition,
                                infoWindow: InfoWindow(
                                  title: positionOne,
                                  snippet: 'Available',
                                  onTap: () {
                                    _popupDialogMikey(context);
                                  },
                                ),
                                icon: pinLocationIcon));
                            _markers.add(Marker(
                                markerId: MarkerId("Anna"),
                                position: pinPosition2,
                                infoWindow: InfoWindow(
                                  title: positionTwo,
                                  onTap: () {
                                    _popupDialog(context);
                                  },
                                  snippet: 'Last seen: 30 mins ago',
                                ),
                                icon: pinLocationIcon));
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#FFFFFF'),
        child: Icon(
          Icons.map,
          color: Hexcolor('#845EC2'),
        ),
        onPressed: () {
          setState(() {
            _currentMapType = _currentMapType == MapType.normal
                ? MapType.satellite
                : MapType.normal;
          });
        },
      ),
    );
  }
}

void _popupDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: Card(
                        color: Hexcolor('#2C73D2'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 40, bottom: 0, left: 10, right: 10),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Anna Baker",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Last seen: 30 mins ago",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RaisedButton(
                                            color: Hexcolor('#845EC2'),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color:
                                                        Hexcolor('#845EC2'))),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Icon(
                                                    Icons.video_call,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Call",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyApp()),
                                              );
                                            }),
                                        RaisedButton(
                                            color: Hexcolor('#845EC2'),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color:
                                                        Hexcolor('#845EC2'))),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Icon(
                                                    Icons.chat,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Chat",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Chat()),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                        child: Image.network(
                            "https://www.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png")),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void _popupDialogMikey(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: Card(
                        color: Hexcolor('#2C73D2'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 40, bottom: 0, left: 10, right: 10),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Michael Scott(Mikey)",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Available",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RaisedButton(
                                            color: Hexcolor('#845EC2'),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color:
                                                        Hexcolor('#845EC2'))),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Icon(
                                                    Icons.video_call,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Call",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyApp()),
                                              );
                                            }),
                                        RaisedButton(
                                            color: Hexcolor('#845EC2'),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color:
                                                        Hexcolor('#845EC2'))),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Icon(
                                                    Icons.chat,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Chat",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatTwo()),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    child: CircleAvatar(
                        child: Image.network(
                            "https://www.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png")),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
