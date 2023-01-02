import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:one/model/weather.dart';
import 'package:one/services/weather_services.dart';

class MainScren extends StatefulWidget {
  const MainScren({super.key});

  @override
  State<MainScren> createState() => _MainScrenState();
}

class _MainScrenState extends State<MainScren> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  String currentWeather = "";
  double tempC = 0;
  double tempF = 0;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    weather = await weatherService.getWeatherData("Kabul");
    setState(() {
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
    });

    print(weather.temperatureC);
    print(weather.temperatureF);
    print(weather.condition);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentWeather),
            Text(tempC.toString()),
            Text(tempF.toString()),
          ],
        ),
      ),
    );
  }
}
