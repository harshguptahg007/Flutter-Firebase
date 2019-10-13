import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/fetch_image.dart';
import 'package:flutter_firebase/fetch_text.dart';
import 'package:flutter_firebase/send_image.dart';
import 'package:flutter_firebase/send_text.dart';
import 'package:flutter_firebase/firebase_functions.dart';

class HomePage extends StatelessWidget {
  HomePage({this.user});

  FirebaseUser user;
  UserRepository userRepository = new UserRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flutter Firebase'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text('Welcome ' + user.email),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('Send Text'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(body: SendText())));
                  },
                ),
                RaisedButton(
                  child: Text('Fetch Text'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FetchText()));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('Send Image'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(body: SendImage())));
                  },
                ),
                RaisedButton(
                  child: Text('Fetch Image'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FetchImage()));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 80.0,
            ),
            Container(
              child: Center(
                child: RaisedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    userRepository.signOut().then((data) {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
