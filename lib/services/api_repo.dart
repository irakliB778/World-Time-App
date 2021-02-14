import 'dart:convert';
import 'package:http/http.dart';
import 'package:world_time_app/model/time_data.dart';
import 'package:world_time_app/model/weather.dart';

class ApiRepo {
  String timeUrl = 'http://worldtimeapi.org/api/timezone/';
  String weatherUrl =
      'http://api.openweathermap.org/data/2.5/weather?q=Tbilisi&appid=cac4ce6f19677bc058014138933baaec';
  String locUrl;

  Future<Weather> getWeather(TimeData tData) async {
    String location = tData.location;
    print(location);
    Response response = await get(
        'http://api.openweathermap.org/data/2.5/weather?q=$location&appid=cac4ce6f19677bc058014138933baaec');
    Map weatherdata = jsonDecode(response.body);
    return Weather.fromjson(weatherdata);
  }

  Future<TimeData> getTime(TimeData data) async {
    String url = timeUrl + data.url;
    Response response = await get(url);
    Map timedata = jsonDecode(response.body);
    data.update(timedata);
    return data;
  }
}
