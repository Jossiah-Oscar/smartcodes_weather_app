import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class WeatherResponse {
  final dynamic weather;
  final dynamic temperature;

  WeatherResponse({this.weather, this.temperature});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
        weather: json['weather'], temperature: json['main']['temp']);
  }
}
