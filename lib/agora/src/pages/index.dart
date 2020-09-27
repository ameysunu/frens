import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Hexcolor('#FFE8F7'),
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('images/home.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Hexcolor('#FFE8F7'),
        title: Text(
          'Call Team',
          style: TextStyle(
            color: Hexcolor('#5C6178'),
            fontFamily: 'Gotham',
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/home.png"),
              fit: BoxFit.contain,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      style: TextStyle(
                          color: Hexcolor('#5C6178'), fontFamily: 'Gotham'),
                      controller: _channelController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Hexcolor('#5C6178'), fontFamily: 'Gotham'),
                        hintStyle: TextStyle(
                            color: Hexcolor('#5C6178'), fontFamily: 'Gotham'),
                        errorStyle:
                            TextStyle(color: Colors.red, fontFamily: 'Gotham'),
                        errorText: _validateError ? 'ID is mandatory' : null,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        hintText: 'Enter Team ID',
                      ),
                    ))
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      //title: Text(ClientRole.Broadcaster.toString()),
                      title: Text(
                        "Start a call",
                        style: TextStyle(
                            fontFamily: 'Gotham', color: Hexcolor('#5C6178')),
                      ),
                      leading: Radio(
                        value: ClientRole.Broadcaster,
                        groupValue: _role,
                        onChanged: (ClientRole value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      // title: Text(ClientRole.Audience.toString()),
                      title: Text(
                        "Join a meeting",
                        style: TextStyle(
                            fontFamily: 'Gotham', color: Hexcolor('#5C6178')),
                      ),
                      leading: Radio(
                        value: ClientRole.Audience,
                        groupValue: _role,
                        onChanged: (ClientRole value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: onJoin,
                          child: Text(
                            'Let\'s go!',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          color: Colors.white,
                          textColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Kindly contact your administrator for an ID if you are joining as an attendee.",
                    style: TextStyle(
                        color: Hexcolor('#5C6178'),
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Gotham'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
