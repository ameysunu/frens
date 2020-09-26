import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#845EC2'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.asset('images/main.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Swipe your ID to enter',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 2, bottom: 20),
                  child: Text(
                    'For security reasons, we need some ID, maybe Google.',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.white54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Image.asset('images/google.png'),
                          ),
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(fontFamily: 'Poppins'),
                        )
                      ],
                    ),
                    onPressed: () {
                      null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
