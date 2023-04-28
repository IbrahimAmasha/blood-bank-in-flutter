import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
    List? types;

    MyTable(List types) {
        this.types = types;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: DataTable(
                    columnSpacing: 22,
                    columns: const <DataColumn>[
                        DataColumn(
                            label: Text(
                                'Blood Type',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 24, // Updated font size
                                ),
                            ),
                        ),
                        DataColumn(
                            label: Text(
                                'Available bags',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 24,
                                ),
                            ),
                        ),
                    ],
                    rows: <DataRow>[
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'A+',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![0].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'A-',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![1].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'B+',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![2].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'B-',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![3].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'AB+',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![4].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'AB-',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![5].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'O+',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),
                                DataCell(
                                    Text(
                                        types![6].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                            ],
                        ),
                        DataRow(
                            cells: <DataCell>[
                                DataCell(
                                    Text(
                                        'O-',
                                        style: TextStyle(fontSize: 24), // Updated font size
                                    ),
                                ),

                                DataCell(
                                    Text(
                                        types![7].toString(),
                                        style: TextStyle(fontSize: 33), // Updated font size
                                    ),
                                ),
                          // DataCell(Text('Manager')),
                      ],
                  ),
              ],
          ),
        ),);

    }
}
