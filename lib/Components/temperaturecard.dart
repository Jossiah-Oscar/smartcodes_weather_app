import 'package:flutter/material.dart';

class TemperatureCardUI extends StatelessWidget {
  final String useImage;
  final double temp;
  final Color textColor;
  final Color cardColor;
  final String temperature;
  final String weathertype;
  final double assetWidth;

  TemperatureCardUI({
    this.textColor = Colors.black,
    this.cardColor = Colors.green,
    this.assetWidth,
    this.weathertype,
    this.useImage,
    this.temperature,
    this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: cardColor,
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                useImage,
                width: 60.0,
                height: assetWidth,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                temperature,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: 45.0,
              ),
              Text(weathertype,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
