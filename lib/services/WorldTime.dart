import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name
  String time; //time on this location
  String url; //url from WorldTimeApi
  String flag; //contry flage image
  bool isDayTime;
  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    var url = 'http://worldtimeapi.org/api/timezone/${this.url}';
    Response response = await get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    String datatime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);
    DateTime now = DateTime.parse(data['datetime']);
    now = now.add(Duration(hours: int.parse(offset)));
    time = DateFormat.jm().format(now);

    isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
    print(time);
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
