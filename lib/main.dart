import 'package:flutter/material.dart';
import 'package:flutter_firebase/login_page.dart';

void main() => runApp(FlutterFirebase());

class FlutterFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}