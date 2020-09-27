import 'package:flutter/material.dart';
import 'package:frens/login.dart';
import 'package:hexcolor/hexcolor.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#845EC2'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Hexcolor('#D5CCE6'),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Hexcolor('#D5CCE6'),
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              email,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "My Friends",
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.network(
                                      "https://www.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png")),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Mikey",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  width: 150,
                                  child: Image.network(
                                      "https://www.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png")),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Anna",
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "My Friend Requests",
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
