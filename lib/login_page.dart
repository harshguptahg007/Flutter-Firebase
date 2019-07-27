import 'package:flutter/material.dart';
import 'package:flutter_firebase/sign_in_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
                      child: Text('Sign in'),
                      onPressed: (){
                        _navigateToSignInPage(context);
                      },
                  ),
                  new RaisedButton(
                    child: Text('Log in'),
                    onPressed: (){
                      //TODO : log in over here
                    },
                  ),
                ],
              ),
              new RaisedButton(
                child: Text('Login with Google'),
                onPressed: () {
                  //TODO : google sign up code here
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
}
