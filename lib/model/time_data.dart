import 'package:intl/intl.dart';

class TimeData {
  String time; //time on this location
  String location;
  String flag;
  String url;
  bool isDayTime = true;
  TimeData({
    this.flag,
    this.location,
    this.url,
  });

  void update(Map data) {
    int integerOffset = 0;
    String offset = data['utc_offset'].toString().substring(1, 3);

    if (data['utc_offset'][0] == "-")
      integerOffset = -1 * (int.parse(offset));
    else
      integerOffset = (int.parse(offset));

    DateTime now = DateTime.parse(data['datetime']);
    now = now.add(Duration(hours: integerOffset));
    this.time = DateFormat.Hm().format(now);
    this.isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
  }
}
