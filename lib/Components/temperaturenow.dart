import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartcodes_weather_app/Model/weather.dart';

class TemperatureNow extends StatefulWidget {
  final String todayTemperature;
  final String weatherCondition;
  final String humidityValue;

  const TemperatureNow({
    @required this.todayTemperature,
    @required this.weatherCondition,
    @required this.humidityValue,
    Key key,
  }) : super(key: key);

  @override
  _TemperatureNowState createState() => _TemperatureNowState();
}

class _TemperatureNowState extends State<TemperatureNow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 90.0,
          left: 30.0,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  widget.todayTemperature,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 70.0),
                ),
                Text(
                  widget.weatherCondition,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                Text(
                  widget.humidityValue,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
