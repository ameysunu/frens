import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'login.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
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
