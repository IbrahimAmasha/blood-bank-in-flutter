import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:proj1/layout/blood_bank/donate.dart';
import 'package:proj1/layout/blood_bank/request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Available_blood.dart';
import 'about_us.dart';



class HomePage extends StatelessWidget {

  static String ? name ;

  HomePage({String? name})
  {
    HomePage.name = name;
  }




  List<List<String>>  newList = [];
  List blood_quantities = [];
  // final List<Map<String, String>> data = [];
  // final List<String> headers = [];

  List<String>  hospitals_list = ['d'];



//getting the list of available blood quantities
  Future db2()async
  {
    var url = "http://192.168.1.2/myfolder/donations.php";
    var response = await http.post(Uri.parse(url),body:
    {
    });
    final decodedResponse = json.decode(response.body);
    blood_quantities = decodedResponse ;
  }




  @override
  Widget build(BuildContext context) {
    db2();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffde2c2c),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg'),
                  radius: 30,
                ),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Future db3()async
                      {
                        var url = "http://192.168.1.2/myfolder/hospitals.php";
                        var response = await http.post(Uri.parse(url),body:
                        {
                        });
                        final decodedResponse = json.decode(response.body);
                        // final myList = decodedResponse as List<String>;
                        // final intList = myList.map((e) => int.parse(e.toString())).toList();
                        for(int i = 0; i <decodedResponse.length; i++)
                        {
                          decodedResponse[i] = decodedResponse[i].cast<String>().toList();
                          newList.add(decodedResponse[i]);
                        }

                        print(newList);
                        // hospitals_list = stringList[0];
                        hospitals_list = ['1121'];
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  DonateBloodScreen(newList)),
                        );
                      }
                      db3();
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person_add, size: 64,color: Color(0xffde2c2c)),
                          SizedBox(height: 16.0),
                          Text("Donate"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Future db2()async
                        {
                          var url = "http://192.168.1.2/myfolder/donations.php";
                          var response = await http.post(Uri.parse(url),body:
                          {
                          });
                          final decodedResponse = json.decode(response.body);
                        }
                        db2();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyTable(blood_quantities)),
                        );
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.data_exploration, size: 64,color: Color(0xffde2c2c)),
                            SizedBox(height: 16.0),
                            Text("data"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Future db2()async
                      {
                        var url = "http://192.168.1.2/myfolder/donations.php";
                        var response = await http.post(Uri.parse(url),body:
                        {
                        });
                        final decodedResponse = json.decode(response.body);
                      }
                      db2();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  RequestBloodScreen(blood_quantities)),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.favorite, size: 64,color: Color(0xffde2c2c)),
                          SizedBox(height: 16.0),
                          Text("request blood"),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  About_Us()),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.info, size: 64,color: Color(0xffde2c2c)),
                          SizedBox(height: 16.0),
                          Text("Option 4"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
