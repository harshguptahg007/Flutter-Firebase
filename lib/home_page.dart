import 'package:flutter/material.dart';
import 'package:flutter_firebase/user_repository.dart';

class HomePage extends StatelessWidget {

  UserRepository userRepository = new UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Text('Welcome'),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                child: Text('Logout'),
                onPressed: (){
                  userRepository.signOut().then((data){
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
