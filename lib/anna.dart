import 'package:flutter/material.dart';

class Anna extends StatefulWidget {
  @override
  _AnnaState createState() => _AnnaState();
}

class _AnnaState extends State<Anna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Card(
            child: Container(
              height: 100.0,
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, -0.4),
            child: Align(
              child: CircleAvatar(
                radius: 25.0,
                child: Text("A"),
              ),
              alignment: FractionalOffset(0.5, 0.0),
            ),
          ),
        ],
      ),
    );
  }
}
