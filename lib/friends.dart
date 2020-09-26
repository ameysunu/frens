import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'login.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
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
    LatLng pinPosition1 = LatLng(40.744830, -73.997520);
    LatLng pinPosition2 = LatLng(40.660960, -73.966570);

    String positionOne = "David";
    String positionTwo = "Mary";
    String positionThree = "Chris";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#FF6F91'),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Friends near $name",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      backgroundColor: Hexcolor('#FF6F91'),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/home.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: initialLocation,
                      mapType: _currentMapType,
                      myLocationEnabled: true,
                      markers: _markers,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        setState(() {
                          _markers.add(Marker(
                              markerId: MarkerId("David"),
                              position: pinPosition,
                              infoWindow: InfoWindow(
                                title: positionOne,
                                snippet: 'Near you',
                              ),
                              icon: pinLocationIcon));

                          _markers.add(Marker(
                              markerId: MarkerId("Mary"),
                              position: pinPosition1,
                              infoWindow: InfoWindow(
                                title: positionTwo,
                                snippet: 'Near you',
                              ),
                              icon: pinLocationIcon));

                          _markers.add(Marker(
                              markerId: MarkerId("Chris"),
                              position: pinPosition2,
                              infoWindow: InfoWindow(
                                title: positionThree,
                                snippet: 'Near you',
                              ),
                              icon: pinLocationIcon));
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Hexcolor('#FF9671'),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            child: Image.network(
                                'http://www.hotavatars.com/wp-content/uploads/2019/01/I80W1Q0.png'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "David Jonah",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Text(
                            "davidfreek@example.com",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showAlertDialog(context);
                          })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Card(
                  color: Hexcolor('#D65DB1'),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundColor: Hexcolor('#D65DB1'),
                            child: Image.network(
                                'https://www.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mary Beckham",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Text(
                            "marybeck@example.com",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showAlertDialog(context);
                          })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Hexcolor('#FFC75F'),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            child: Image.network(
                                'https://cms-assets.tutsplus.com/uploads/users/107/posts/26101/image/22-x-men-avatars.jpg'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chris Martin",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          Text(
                            "chrismartyy@example.com",
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.person_add_alt_1_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showAlertDialog(context);
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text(
      "Continue",
      style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Hexcolor('#845EC2'),
    title: Text(
      "Confirm Request",
      style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    ),
    content: Text(
      "Do you want to send a friend request?",
      style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
