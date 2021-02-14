class Weather {
  String weather;
  String temp;
  String windspeed;

  Weather.fromjson(Map data) {
    this.weather = data['weather'][0]['description'];
    this.temp = this.convToC(data);
    this.windspeed = data['wind']['speed'].toString();
  }
  String convToC(Map data) {
    String temp = ((data['main']['temp']) - 273.1).toStringAsFixed(2);
    return temp;
  }
}
