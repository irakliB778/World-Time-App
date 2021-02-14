import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/model/time_data.dart';
import 'package:world_time_app/model/weather.dart';

import 'package:world_time_app/services/api_repo.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  ApiRepo api = ApiRepo();

  Future<void> startworldtime() async {
    TimeData timeData = TimeData(
      location: 'Tbilisi',
      url: 'Asia/Tbilisi',
      flag: '',
    );
    Weather weatherData;

    timeData = await api.getTime(timeData);
    weatherData = await api.getWeather(timeData);
    print(weatherData.temp);
    await Navigator.pushReplacementNamed(
      context,
      '/Home',
      arguments: {
        'location': timeData.location,
        'flag': timeData.flag,
        'time': timeData.time,
        'isdaytime': timeData.isDayTime,
        'weather': weatherData.weather,
        'temp': weatherData.temp,
        'windspeed': weatherData.windspeed
      },
    );
  }

  @override
  void initState() {
    startworldtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
          child: SpinKitSquareCircle(
            color: Colors.amber,
            size: 70.0,
            duration: Duration(seconds: 1),
          ),
        ));
  }
}
