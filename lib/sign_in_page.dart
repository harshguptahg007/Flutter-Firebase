import 'package:flutter/material.dart';
import 'package:flutter_firebase/home_page.dart';
import 'package:flutter_firebase/user_repository.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController checkPasswordController = new TextEditingController();

  UserRepository userRepository = new UserRepository();

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
        margin: EdgeInsets.symmetric(horizontal: 15.0),
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
              new SizedBox(
                height: 15.0,
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Re-enter your password here',
                  ),
                  controller: checkPasswordController,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: new RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    //TODO : sign up code here
                    userRepository
                        .signUp(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((data) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
