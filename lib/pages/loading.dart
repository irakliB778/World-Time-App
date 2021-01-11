import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/WorldTime.dart';
// import 'dart:async';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String currentTime = 'loading...';

  Future<String> startworldtime() async {
    WorldTime instance =
        WorldTime(location: 'Tbilisi', url: 'Asia/Tbilisi', flag: '');
    await instance.getTime();
    setState(() {
      currentTime = instance.time;
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
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Text('$currentTime'),
      ),
    );
  }
}
