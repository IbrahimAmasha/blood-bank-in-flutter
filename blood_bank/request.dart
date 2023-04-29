import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




class RequestBloodScreen extends StatefulWidget {
  static List? types;
  RequestBloodScreen(List ? types) {
    RequestBloodScreen.types = types;
  }
  @override
  _BloodDonationFormState createState() => _BloodDonationFormState();
}

class _BloodDonationFormState extends State<RequestBloodScreen> {
  // List? types;
  // RequestBloodScreen(List types) {
  //   this.types = types;
  // }
  List<String> l = [];
static var types = RequestBloodScreen.types;
var types2 ;

 TextEditingController quantityController =  TextEditingController();
  String? _selectedCity;
  String? _selectedHospital;
  List<String> hospitals = [
  ];
  DateTime? _selectedDate;


  final List<String>_blood_Types = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  var quantities = {
    'A+' : types![0] ,
    'A-' : types![1],
    'B+' : types![2],
    'B-' : types![3],
    'AB+' :types![4],
    'AB-' : types![5],
    'O+' : types![6],
    'O-' :types![7]
  };

  // var fruits = {'apple': 1, 'banana': 2, 'orange': 3}

  String ? _selectedBlood ;
  final List<String> _cities = [
    'Cairo',
    'Alexandria',
    'Mansoura',
    'Port said',  ];
  final List<String> _Mansoura_Hospitals = [
    '_Mansoura_Hospital1',
    '_Mansoura_Hospital2',
    '_Mansoura_Hospitals3',
    '_Mansoura_Hospital3',  ];
  final List<String> _cairo_Hospitals = [
    '_cairo_Hospital1',
    '_cairo_Hospital2',
    '_cairo_Hospital3',
    '_cairo_Hospital4',  ];
  final List<String> _alex_Hospitals = [
    '_alex_Hospital1',
    '_alex_Hospital2',
    '_alex_Hospital3',
    '_alex_Hospitals4',  ];
  final List<String> _port_Hospitals = [
    '_port_Hospital1',
    '_port_Hospital2',
    '_port_Hospital3',
    '_port_Hospital4',  ];




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

    // print(fruits['A+']);
    print(types);
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
        title: Text('Request Blood Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
           'Choose your hospital',
                style: TextStyle(fontSize: 18.0),
              ),
              DropdownButtonFormField<String>(

                value: _selectedHospital,
                items: hospitals.map((city) {
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
                    _selectedBlood = value.toString();
                    // hospitals = _Mansoura_Hospitals;
                  });
                },
              ),


              // SizedBox(height: 16.0),
              Text(
                _selectedBlood.toString() != 'null' ?
                'Choose The Amount  ' +

                    '(max Amount for ' + _selectedBlood.toString()
                    + '  is '+ (quantities[_selectedBlood]).toString() + ' bags )'
                : 'Choose The Amount '
                ,

                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                controller:quantityController ,
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
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Set rounded corners radius
                          ), ),
                        backgroundColor: MaterialStateProperty.all<Color>( Color(0xffde2c2c).withOpacity(.8)), // Change the button color
                      ),
                      child: Text('Select date'),
                      onPressed: () => _selectDate(context),
                    ),
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
                  backgroundColor: MaterialStateProperty.all<Color>( Color(0xffde2c2c).withOpacity(.8)), // Change the button color
                ),
                child: Text('Submit'),
                onPressed: () {
                  try {
                    Future db2()async
                    {
                      var url = "http://192.168.1.5/myfolder/requests.php";
                      var response = await http.post(Uri.parse(url),body:
                      {
                        "city" : _selectedCity,
                        "hospital" : _selectedHospital,
                        "blood_type" : _selectedBlood,
                        'amount' : quantityController.text,
                        "date" : _selectedDate.toString(),
                      });

                    }
                    db2();
              print('helllllo');






                  } catch (e) {
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('invalid amount'),
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


                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
