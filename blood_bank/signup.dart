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

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  var code = 0;

  // Future db()async
  // {
  //    // user = TextEditingController();
  //    // pass = TextEditingController();
  //    // email = TextEditingController();
  //   var url = "http://192.168.1.5/myfolder/connect.php";
  //
  //   var response = await http.post(Uri.parse(url),body:
  //   {
  //     "username" : user.text,
  //     "password" : pass.text,
  //     "email" : email.text,
  //   });
  //   // print('uuuuuuuuuuuuuuu' + response.statusCode.toString());
  //    code = response.statusCode ;
  //   return;
  //   if (response !='') {
  //     var data = json.decode(response.body.toString());
  //   } else
  //   {return 1;}
  //
  //
  // }



  // int db()
  // {
  //   var url = "http://192.168.1.5/myfolder/connect.php";
  //
  //   var response =  http.post(Uri.parse(url),body:
  //   {
  //     "username" : user.text,
  //     "password" : pass.text,
  //     "email" : email.text,
  //   });
  //   print('uuuuuuuuuuuuuuu' + response.statusCode.toString());
  //   code = response.statusCode ;
  //
  //   if (response !='') {
  //     var data = json.decode(response.body.toString());
  //   } else
  //   {return 1;}
  //
  //
  //   // if (true) {
  //   //   var data = json.decode(response.body.toString());
  //   //   // Insertion successful, handle the response data as required
  //   //   print('1111111111111111111111111');
  //   // } else {
  //   //   // Insertion failed, handle the error
  //   //   print('Error: ${response.statusCode} - ${response.body}');
  //   //   print('2222222222222222222222222222222');
  //   //   // Display an error message to the user or log the error for debugging purposes
  //   // }
  //
  //   //    if(data == "error" )
  //   //    {
  //   //      b = 0;
  //   //      print(b);
  //   //    print("hi" + response.toString());
  //   //    }
  //   // else
  //   //    {
  //   //     b = 1;
  //   //     print(b);
  //   //    }
  //
  // }
  //


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
                    TextFormField(
                      controller: user,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
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
            ElevatedButton(
                // db();

              onPressed: () {
                Future db2()async
                {

                  var url = "http://192.168.1.5/myfolder/connect.php";
                  var response = await http.post(Uri.parse(url),body:
                  {
                    "username" : user.text,
                    "password" : pass.text,
                    "email" : email.text,
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
                primary: Color(0xffde2c2c),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Navigate to login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()),
                );
              },
              child: Text(
                'Already have an account? Login here',
                style: TextStyle(
                  color: Color(0xffde2c2c),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
