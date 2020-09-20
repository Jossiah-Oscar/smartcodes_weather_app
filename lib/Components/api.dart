import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherResponse {
  final dynamic weather;
  final dynamic temperature;
  final dynamic wind;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic icon;

  WeatherResponse(
      {this.weather,
      this.temperature,
      this.humidity,
      this.icon,
      this.pressure,
      this.wind});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      weather: json['weather'],
      temperature: json['main']['temp'],
      wind: json['wind']['speed'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
    );
  }
}

Future<WeatherResponse> getWeather() async {
  final String _apiKey = '216c77beef936fa1190f08602852e08d';
  final String _city = 'Dar es Salaam';

  String _url =
      'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=$_apiKey&units=metric';
  var _response = await http.get(_url);
  if (_response.statusCode >= 200 && _response.statusCode < 300) {
    return WeatherResponse.fromJson(json.decode(_response.body));
  } else {
    throw Exception('API Call Failed!');
  }
}
