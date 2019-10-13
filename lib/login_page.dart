import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/home_page.dart';
import 'package:flutter_firebase/sign_in_page.dart';
import 'package:flutter_firebase/firebase_functions.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  UserRepository userRepository = new UserRepository();

  bool loginPressed = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter your email here',
                  ),
                  controller: emailController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter your password here',
                  ),
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      _navigateToSignInPage(context);
                    },
                  ),
                  new RaisedButton(
                    child: Text('Log in'),
                    onPressed: () {
                      //TODO : log in over here
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              new RaisedButton(
                child: Text('Login with Google'),
                onPressed: () {
                  loginUser(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logInUser() async {
    await userRepository
        .signInWithCredentials(emailController.text, passwordController.text)
        .then((data) {
      _navigateToHomePage(context, data);
    });
  }

  _navigateToSignInPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  loginUser(BuildContext context) async {
    userRepository.signInWithGoogle().then((data) {
      _navigateToHomePage(context, data);
    });
  }

  _navigateToHomePage(BuildContext context, FirebaseUser user) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
  }
}
