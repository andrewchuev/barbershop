import 'package:barbershop/screens/landing.dart';
import 'package:barbershop/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:barbershop/screens/authorization.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';
import 'services/auth.dart';

void main() => runApp(Barbershop());

class Barbershop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barbershop',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(30, 120, 120, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white)),
        ),
        home: LandingPage(),
      ),
      value: AuthService().currentUser,
    );
  }
}


