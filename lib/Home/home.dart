import 'package:flutter/material.dart';
import 'package:smartcodes_weather_app/Dodoma.dart';
import 'package:smartcodes_weather_app/Dar.dart';
import 'package:smartcodes_weather_app/Arusha.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController(

    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        Dar(),
        Arusha(),
        Dodoma(),
      ],
    );
  }
}
