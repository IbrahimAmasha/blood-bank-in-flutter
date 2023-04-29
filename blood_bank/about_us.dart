import 'package:flutter/material.dart';

class About_Us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Blood Bank'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_important)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_important)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conditions for Blood Donation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            InfoCard(
              title: 'Good Health',
              description:
              'The donor must be in good health and not suffer from any diseases.',
              icon: Icons.favorite,
            ),
            InfoCard(
              title: 'Age Range',
              description: 'The age of the donor must be between 18-45 years.',
              icon: Icons.calendar_today,
            ),
            InfoCard(
              title: 'Weight',
              description: 'The donor must be at least 50kg.',
              icon: Icons.line_weight,
            ),
            InfoCard(
              title: 'Hemoglobin',
              description:
              'The hemoglobin range for men ranges from 14-17 gm, and for women it ranges from 12-14 gm.',
              icon: Icons.local_hospital,
            ),
            InfoCard(
              title: 'Pulse',
              description: 'The pulse should be between 50-100 per minute.',
              icon: Icons.favorite_border,
            ),
            InfoCard(
              title: 'Temperature',
              description: 'The temperature should not exceed 37 degrees celsius.',
              icon: Icons.ac_unit,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const InfoCard({Key? key, required this.title, required this.description, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.red),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
