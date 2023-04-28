import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:proj1/layout/blood_bank/request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Available_blood.dart';
import 'donate.dart';

class HomePage extends StatelessWidget {


//getting the list of available blood quantities
  Future db2()async
  {
    var url = "http://192.168.1.5/myfolder/donations.php";
    var response = await http.post(Uri.parse(url),body:
    {
    });
    final decodedResponse = json.decode(response.body);
    // Cast the decoded response to a List<dynamic> object
    // final myList = decodedResponse as List<dynamic>;
    // Map each element of the list to an int using int.parse()
    // final intList = myList.map((e) => int.parse(e.toString())).toList();
    code = decodedResponse ;
    // Return the List<int> object
    // return intList;
  }

  List<String> hospitals_list = [];
  List code = [];
  final List<Map<String, String>> data = [];
  final List<String> headers = [];
  @override
  Widget build(BuildContext context) {
    db2();
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Future db3()async
                {
                  var url = "http://192.168.1.5/myfolder/hospitals.php";
                  var response = await http.post(Uri.parse(url),body:
                  {
                  });
                  final decodedResponse = json.decode(response.body);
                  // Cast the decoded response to a List<dynamic> object
                  final myList = decodedResponse as List<String>;
                  // Map each element of the list to an int using int.parse()
                  final intList = myList.map((e) => int.parse(e.toString())).toList();
                  // hospitals_list = decodedResponse ;
                  hospitals_list = ['1','2','3','4'] ;
                  // Return the List<int> object
                  return intList;
                }
                db3();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DonateBloodScreen(hospitals_list)),
                );
              },
              child: Text('Donate Blood'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Future db2()async
                {
                  var url = "http://192.168.1.5/myfolder/donations.php";
                  var response = await http.post(Uri.parse(url),body:
                  {
                  });
                  final decodedResponse = json.decode(response.body);
                }
                db2();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTable(code)),
                );
              },
              child: Text('data'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 30),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Future db2()async
                {
                  var url = "http://192.168.1.5/myfolder/donations.php";
                  var response = await http.post(Uri.parse(url),body:
                  {
                  });
                  final decodedResponse = json.decode(response.body);
                }
                db2();
                // Navigate to donate blood screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RequestBloodScreen(code)),
                );
              },
              child: Text('Request Blood'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(300, 50),
              ),
            ),
            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
