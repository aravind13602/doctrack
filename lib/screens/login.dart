import 'package:doctrack/screens/homescreen.dart';
import 'package:doctrack/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';
import '../constants.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    bgimage,
                    height: height * 0.27,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: height * 0.37,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0.3, 0.75],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.white],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        appName,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  slogan,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20),
                child: Container(
                  child: Text(
                    "  $loginString",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withOpacity(0.3),
                        Colors.transparent
                      ],
                    ),
                    border: Border(
                      left: BorderSide(color: primaryColor, width: 5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (email) {
                    if (email == null || email.isEmpty)
                      return 'Please enter your email';
                    else if (!RegExp(
                        "^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}\$")
                        .hasMatch(email)) return "Invalid email";
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefixIcon: Icon(Icons.email, color: primaryColor),
                    labelText: "EMAIL ADDRESS",
                    labelStyle:
                    TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (password) {
                    if (password == null || password.isEmpty)
                      return 'Please enter your password';
                    else if (password.length < 8 || password.length > 15)
                      return 'Password must be 8 to 15 characters long';
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    prefixIcon: Icon(Icons.lock_open, color: primaryColor),
                    labelText: "PASSWORD",
                    labelStyle:
                    TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implement Forgot Password functionality here
                    }
                  },
                  child: Text(
                    forgettext,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: width * 0.7, // Adjust the width as needed
                  child: FloatingActionButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement Login functionality here
                        _email = email;
                        _password = password;

                        // Check if username and password match the criteria
                        if (_email == 'admin@admin.com' && _password == 'admin123') {
                          // Navigate to HomeScreen if credentials are correct
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        } else {
                          // Handle incorrect credentials here
                          // For now, you can show a snackbar or dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid username or password'),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      loginbut,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    backgroundColor: Color.fromARGB(255, 230, 18, 14),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account"),
                  TextButton(
                    onPressed: () {
                      // Navigate to the RegisterPage when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
