import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose-location');
                  },
                  icon: Icon(Icons.location_on),
                  label: Text('Choose Location'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    letterSpacing: 5.0,
                    fontSize: 20.0,
                    color: Colors.brown[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 2.0,
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
