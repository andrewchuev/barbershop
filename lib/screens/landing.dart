import 'package:barbershop/domain/user.dart';
import 'package:barbershop/screens/authorization.dart';
import 'package:barbershop/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
