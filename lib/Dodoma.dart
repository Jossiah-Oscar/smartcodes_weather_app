import 'package:flutter/material.dart';
import 'package:smartcodes_weather_app/Components/temperaturecard.dart';
import 'package:smartcodes_weather_app/Components/temperaturenow.dart';
import 'package:smartcodes_weather_app/Components/domapi.dart';

class _DodomaState extends State<Dodoma> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgrounddom.png"),
              fit: BoxFit.fill),
        ),
        child: FutureBuilder(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Column(
                children: <Widget>[
                  TemperatureNow(
                    todayTemperature: "${snapshot.data.temperature}\u00B0",
                    humidityValue: "${snapshot.data.weather[0]['main']}",
                    weatherCondition: "Dodoma",
                  ),
                  SizedBox(
                    height: 150.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        TemperatureCardUI(
                          temperature: "${snapshot.data.wind}\km/h",
                          weathertype: "Wind",
                          useImage: "assets/images/light.png",
                          textColor: Colors.white,
                          cardColor: Colors.cyan,
                        ),
                        TemperatureCardUI(
                          temperature: "${snapshot.data.humidity}\%",
                          weathertype: "Humidity",
                          useImage: "assets/images/sun.png",
                          //assetWidth: 55.0,
                          textColor: Colors.white,
                          cardColor: Colors.blueGrey,
                        ),
                        TemperatureCardUI(
                          useImage: "assets/images/sun.png",
                          temperature: "${snapshot.data.pressure}\hpa",
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

class Dodoma extends StatefulWidget {
  @override
  _DodomaState createState() => _DodomaState();
}
