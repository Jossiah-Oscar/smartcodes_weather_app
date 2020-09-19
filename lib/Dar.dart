import 'package:flutter/material.dart';
import 'package:smartcodes_weather_app/Components/temperaturecard.dart';
import 'package:smartcodes_weather_app/Components/temperaturenow.dart';
import 'package:smartcodes_weather_app/Components/api.dart';

class _DarState extends State<Dar> {
  Future<WeatherResponse> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: FutureBuilder(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Column(
                children: <Widget>[
                  TemperatureNow(
                    todayTemperature: "${snapshot.data.temperature}\u00B0",
                    weatherCondition:"${snapshot.data.weather[0]['main']}",
                    humidityValue: "Dar Es Salaam",
                  ),
                  SizedBox(
                    height: 150.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        TemperatureCardUI(
                          temperature: "5km/h",
                          weathertype: "Wind",
                          useImage: "assets/images/sun.png",
                          textColor: Colors.white,
                          cardColor: Colors.cyan,
                        ),
                        TemperatureCardUI(
                          temperature: "81%",
                          weathertype: "Humidity",
                          useImage: "assets/images/sun.png",
                          //assetWidth: 55.0,
                          textColor: Colors.white,
                          cardColor: Colors.blueGrey,
                        ),
                        TemperatureCardUI(
                          useImage: "assets/images/sun.png",
                          temperature: "  29.98 Hg",
                          weathertype: "Air Pressure",
                          textColor: Colors.white,
                          cardColor: Colors.pink,
                        ),
                      ],
                    ),
                  )
                ],
              );
          },
        ),
      ),
    );
  }
}

class Dar extends StatefulWidget {
  @override
  _DarState createState() => _DarState();
}
