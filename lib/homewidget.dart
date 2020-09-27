import 'package:flutter/material.dart';
import 'package:frens/friends.dart';
import 'package:frens/user.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Home(),
    Friends(),
    User(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Hexcolor('#845EC2'),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'Home',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_add, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'Friends',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'User',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
