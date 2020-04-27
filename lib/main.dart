import 'package:flutter/material.dart';
import 'package:barbershop/screens/authorization.dart';

void main() => runApp(Barbershop());

class Barbershop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbershop',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(30, 120, 120, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.white)),
      ),
      home: AuthorizationPage(title: 'Barbershop'),
    );
  }
}


