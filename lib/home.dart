import 'dart:async';

import 'package:flutter/material.dart';
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
                                ),
                                icon: pinLocationIcon));
                            _markers.add(Marker(
                                markerId: MarkerId("Anna"),
                                position: pinPosition2,
                                infoWindow: InfoWindow(
                                  title: positionTwo,
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
