import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
    final List? types;

    MyTable(this.types);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                    child: DataTable(
                        headingRowHeight: 80,
                        dataRowHeight: 70,
                        columns: [
                            DataColumn(
                                label: Text(
                                    'Blood Type',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[900],
                                    ),
                                ),
                            ),
                            DataColumn(
                                label: Text(
                                    'Available Bags',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                    ),
                                ),
                            ),
                        ],
                        rows: [
                            _buildDataRow('A+', types![0].toString()),
                            _buildDataRow('A-', types![1].toString()),
                            _buildDataRow('B+', types![2].toString()),
                            _buildDataRow('B-', types![3].toString()),
                            _buildDataRow('AB+', types![4].toString()),
                            _buildDataRow('AB-', types![5].toString()),
                            _buildDataRow('O+', types![6].toString()),
                            _buildDataRow('O-', types![7].toString()),
                        ],
                    ),
                ),
            ),
        );
    }

    DataRow _buildDataRow(String bloodType, String availableBags) {
        return DataRow(
            cells: [
                DataCell(
                    Text(
                        bloodType,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900],
                        ),
                    ),
                ),
                DataCell(
                    Text(
                        availableBags,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                        ),
                    ),
                ),
            ],
        );
    }
}
