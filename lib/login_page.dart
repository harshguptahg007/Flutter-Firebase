import 'package:flutter/material.dart';
import 'package:flutter_firebase/home_page.dart';
import 'package:flutter_firebase/sign_in_page.dart';
import 'package:flutter_firebase/user_repository.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
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
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter your password here',
                  ),
                  controller: passwordController,
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(
                      child: Text('Sign Up'),
                      onPressed: (){
                        _navigateToSignInPage(context);
                      },
                  ),
                  new RaisedButton(
                    child: Text('Log in'),
                    onPressed: (){
                      //TODO : log in over here
                      userRepository.signInWithCredentials(emailController.text, passwordController.text).then((data){
                        _navigateToHomePage(context);
                      });
                    },
                  ),
                ],
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

  _navigateToSignInPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
  }

  loginUser(BuildContext context) async {
    userRepository.signInWithGoogle().then((data){
      print(data);
      _navigateToHomePage(context);
    });
  }

  _navigateToHomePage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}
