import 'package:flutter/material.dart';
class About_As extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'Blood Bank',
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_important,) )
          ,
          IconButton(onPressed: (){}, icon:  Icon(Icons.notification_important,))
          ,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Articles',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text('Conditions for blood donation:',style: TextStyle(fontSize: 20),),
              Text('The donor must be in good health and not suffer from any diseases.',style: TextStyle(fontSize: 20),),
              Text('The age of the donor must be between 18-45 years.',style: TextStyle(fontSize: 20),),
              Text('The donor must be at least 50kg.',style: TextStyle(fontSize: 20),),
              Text('The hemoglobin range for men ranges from 14-17 gm, and for women it ranges from 12-14 gm.',style: TextStyle(fontSize: 20),),
              Text('The pulse should be between 50-100 per minute.',style: TextStyle(fontSize: 20),),
              Text('The temperature should not exceed 37 degrees calsius.',style: TextStyle(fontSize: 20),),




            ],

          ),
        ),
      ),

    );
  }
}