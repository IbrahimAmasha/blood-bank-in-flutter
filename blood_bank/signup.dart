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


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  //controllers to get the values of username , password , email ,
  // and then store them in database
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  var code = 0;//will store the value of http response code

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset(
              'assets/images/3.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50),
            Text(
              'Create Account',
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
                  Column(children: [
                    //username
                    TextFormField(
                      controller: user,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Color(0xffde2c2c)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde2c2c)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde2c2c)),
                        ),
                        prefixIcon: Icon(Icons.person, color:Color(0xffde2c2c)),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty || code ==404) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                  ],),
                    SizedBox(height: 30),
                    //email
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xffde2c2c) ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde2c2c)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde2c2c)),
                        ),
                        prefixIcon: Icon(Icons.email, color: Color(0xffde2c2c)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    //password
                    TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Color(0xffde2c2c)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde2c2c)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde2c2c)),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Color(0xffde2c2c)),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            //submit button and connect to mysql database
            ElevatedButton(
              onPressed: () {
                Future db2()async
                {
                  //php and mysql connection
                  var url = "http://192.168.1.2/myfolder/connect.php";
                  //sending post request to database with the register data
                  var response = await http.post(Uri.parse(url),body:
                  {
                    "username" : user.text,
                    "password" : pass.text,
                    "email" : email.text,
                  });
                  //getting http response code ,
                  //if it equals 200 then this username is new and valid
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
               //dialog to show error
               showDialog(
                 context: context,
                 builder: (BuildContext context) {
                   return AlertDialog(
                     title: Text('Error'),
                     content: Text('username is already used , try another one'),
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
                  if (response !='') {
                    var data = json.decode(response.body.toString());
                  } else
                  {return 1;}


                }
                db2();
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 30),
            // button to navigate to login screen
            // if you already have an account
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()),
                );
              },
              child: Text(
                'Already have an account? Login here',
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
