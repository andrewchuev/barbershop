import 'package:barbershop/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbershop'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {
            AuthService().logOut();
          }, icon: Icon(Icons.supervised_user_circle, color: Colors.white,), label: Text(''))
        ],
      ),
      body: Center(
        child: Text('Barbershop'),
      ),
    );
  }
}
