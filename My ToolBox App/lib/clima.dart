import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _cityName = "Santo Domingo";
  String _temperature = "";
  String _description = "";
  String _icon = "";

  Future<void> _fetchData() async {
    final apiKey = "1aa5a3cd442e7a900a4199670fa87ea0";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$_cityName,do&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    setState(() {
      _temperature = data["main"]["temp"].toString() + "°C";
      _description = data["weather"][0]["description"].toString();
      _icon =
          "http://openweathermap.org/img/w/${data["weather"][0]["icon"]}.png";
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clima en República Dominicana'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(_icon),
              SizedBox(height: 20.0),
              Text(
                '$_temperature',
                style: TextStyle(fontSize: 36.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '$_description',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
