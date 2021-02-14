// import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String image = data['isdaytime'] ? 'day.png' : 'night.png';
    Color color = data['isdaytime'] ? Colors.blue[300] : Colors.blue[700];
    Color textcolor = data['isdaytime'] ? Colors.black : Colors.white;
    return Scaffold(
        backgroundColor: color,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$image'),
                fit: BoxFit.cover,
              ),
            ),
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
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(
                              context, '/choose-location');
                          setState(() {
                            data = {
                              'location': result['location'],
                              'time': result['time'],
                              'isdaytime': result['isdaytime'],
                              'weather': result['weather'],
                              'temp': result['temp'],
                              'windspeed': result['windspeed']
                            };
                          });
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
                          color: textcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2.0,
                          color: textcolor,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Text(
                          data['weather'],
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3.0,
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              data['temp'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.0,
                                  letterSpacing: 3.0),
                            ),
                          ),
                          Text(
                            data['windspeed'],
                            style: TextStyle(
                              color: Colors.amber,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
