import 'package:barbershop/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barbershop/domain/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 70, bottom: 40),
        child: Container(
          child: Align(
            child: Text(
              'BARBERSHOP',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
            controller: controller,
            obscureText: obscure,
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: icon,
                ),
              ),
            )),
      );
    }

    Widget _button(String label, void func()) {
      return RaisedButton(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).primaryColor,
          color: Colors.white,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          onPressed: () {
            func();
          });
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.email), "EMAIL", _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock), "PASSWORD", _passwordController, true),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            )
          ],
        ),
      );
    }

    Future<void> _loginButtonAction() async {
      print('button action');

      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.signInWithEmailAndPassword(_email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can't SignIn you! Please check your email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }


    }

    Future<void> _registerButtonAction() async {
      print('button action');

      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.registerWithEmailAndPassword(_email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can't Register you! Please check your email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }


    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          showLogin
              ? Column(
                  children: <Widget>[
                    _form('LOGIN', _loginButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text('Not registred yet? Register!', style: TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () {
                          setState(() {
                            showLogin = false;
                          });
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  children: <Widget>[
                    _form('REGISTER', _registerButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text('Already registered? Login!', style: TextStyle(fontSize: 20, color: Colors.white)),
                        onTap: () {
                          setState(() {
                            showLogin = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              'assets/images/big-logo.png',
              height: 180,
            ),
          )
        ],
      ),
    );
  }
}
