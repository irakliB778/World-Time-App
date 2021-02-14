import 'package:flutter/material.dart';
import 'package:world_time_app/model/time_data.dart';
import 'package:world_time_app/model/weather.dart';
import 'package:world_time_app/services/api_repo.dart';
import 'package:world_time_app/helper_data.dart' as helperData;

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  ApiRepo api = new ApiRepo();

  void updateTime(index) async {
    TimeData timeData = helperData.locations[index];
    Weather weatherData;

    timeData = await api.getTime(timeData);
    weatherData = await api.getWeather(timeData);
    print(weatherData.weather);

    Navigator.pop(
      context,
      {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        actions: [],
        title: Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: helperData.locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(helperData.locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${helperData.locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
