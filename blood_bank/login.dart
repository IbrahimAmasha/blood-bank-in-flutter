import 'package:flutter/material.dart';
import 'package:proj1/layout/blood_bank/signup.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'options.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var code = 0;
  TextEditingController user = TextEditingController(); //user.text (the username we write )
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/images/onboarding1.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller:user ,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                      ),
                      obscureText: true, //to hide the password
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Future dbuser()async
                  {

                    var url = "http://192.168.1.5/myfolder/login.php";
                    var response = await http.post(Uri.parse(url),body:
                    {
                      "username" : user.text,
                      "password" : pass.text,
                    });
                    code = response.statusCode ;
                    if(code==200 && _formKey.currentState!.validate())
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomePage()),
                      );
                    }
                    else
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Password and username don\'t match'),
                            actions: <Widget>[

                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  // perform the action here
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );

                    }



                  }
                  dbuser();
                }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Navigate to registration screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SignupPage()),
                );
              },
              child: Text(
                'Don\'t have an account? Register here',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
