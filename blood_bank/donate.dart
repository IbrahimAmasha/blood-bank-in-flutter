import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:proj1/layout/blood_bank/options.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




class DonateBloodScreen extends StatefulWidget {
  @override
  static List<List<String>>  ? list ;
  _BloodDonationFormState createState() => _BloodDonationFormState();

  DonateBloodScreen(List<List<String>>  ? l )
  {
    DonateBloodScreen.list = l;
  }
}

class _BloodDonationFormState extends State<DonateBloodScreen> {

  static List<List<String>>  ? my_list = DonateBloodScreen.list;


  String? _selectedCity;
  String? _selectedHospital;
   List<String> ? hospitals = [];

  final List<String>_blood_Types = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String ? _selectedBlood;
  DateTime? _selectedDate;

  final List<String> _cities = ['Cairo', 'Alexandria', 'Mansoura', 'Port said',  ];
   List<String> _cairo_Hospitals =my_list![0] ;
   List<String> _alex_Hospitals = my_list![1] ;
   List<String> ? _Mansoura_Hospitals  = my_list![2];
   List<String> _port_Hospitals = my_list![3];




  Future<void> _selectDate(BuildContext context) async {


    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    print( _Mansoura_Hospitals);
    print(DonateBloodScreen.list);
    if(_selectedCity == 'Cairo')
    {setState(() {
      // insertData();
      hospitals = _cairo_Hospitals ;
    });}

    else if(_selectedCity == 'Mansoura')
    {
      setState(() {
        hospitals = _Mansoura_Hospitals;
      });
    }
    if(_selectedCity == 'Alexandria')
    {setState(() {
      hospitals = _alex_Hospitals ;
    });}

    else if(_selectedCity == 'Port said')
    {
      setState(() {
        hospitals = _port_Hospitals;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose your city:',
              style: TextStyle(fontSize: 18.0),
            ),

            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(

              value: _selectedCity,
              items: _cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;

                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Choose The Hospital :',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButtonFormField<String>(

              value: _selectedHospital,
              items: hospitals!.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHospital = value;
                  // hospitals = _Mansoura_Hospitals;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Choose Your Blood Type :',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButtonFormField<String>(

              value: _selectedBlood,
              items: _blood_Types.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedBlood = value;
                });
              },
            ),


            SizedBox(height: 16.0),

            Text(
              'Choose your donation date:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Selected date: ${_selectedDate!.toString()}',
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Set rounded corners radius
                      ), ),
                    backgroundColor: MaterialStateProperty.all<Color>( Color(0xffde2c2c).withOpacity(0.8)), // Change the button color
                  ),
                  child: Text('Select date'),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Set rounded corners radius
                  ), ),
                backgroundColor: MaterialStateProperty.all<Color>( Color(0xffde2c2c).withOpacity(0.8)), // Change the button color
              ),
              child: Text('Submit'),
              onPressed: () {
                //send data to database by post request
                Future db2()async
                {
                  var url = "http://192.168.1.2/myfolder/donate.php";
                  var response = await http.post(Uri.parse(url),body:
                  {
                    "city" : _selectedCity,
                    "hospital" : _selectedHospital,
                    "blood_type" : _selectedBlood,
                    "date" : _selectedDate.toString(),
                  });

                }
                db2();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
