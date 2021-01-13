import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time_app/services/WorldTime.dart';
// import 'dart:async';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<String> startworldtime() async {
    WorldTime instance =
        WorldTime(location: 'Tbilisi', url: 'Asia/Tbilisi', flag: '');
    await instance.getTime();
    await Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    startworldtime();
    // TODO: implement initStat
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.amber,
            size: 70.0,
            duration: Duration(microseconds: 500),
          ),
        ));
  }
}
