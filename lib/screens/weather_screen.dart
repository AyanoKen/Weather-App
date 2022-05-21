import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/utilities/consts.dart';
import '../utilities/weather.dart';
import 'city_screen.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.locationWeather});

  final locationWeather;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 10;
  int condition = 0;
  String cityName = "Delhi";
  String weatherMessage = "Error, change Location or try again";
  String weatherIcon = " ";

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        condition = 0;
        cityName = "None";
        weatherMessage = "Error, change Location or try again";
        weatherIcon = " ";
        return;
      }
      double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      condition = weatherData["weather"][0]["id"];
      cityName = weatherData["name"];
      weatherMessage = '${weather.getMessage(temperature)} in $cityName';
      weatherIcon = weather.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(255, 116, 134, 1.0),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      weatherIcon,
                      style: TextStyle(fontSize: 120),
                    ),
                    Text(
                      '$temperature°',
                      style: kInfoStyle,
                    ),
                    Text(
                      weatherMessage,
                      textAlign: TextAlign.center,
                      style: kInfoStyle,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Center(
                child: GestureDetector(
                  child: const Text(
                    'Change Location',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () async {
                    var newCityName = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CityScreen();
                    }));
                    if (newCityName != null) {
                      var weatherData =
                          await weather.getCityWeather(newCityName);
                      updateUI(weatherData);
                    }
                  },
                ),
              ),
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                color: Color.fromRGBO(255, 116, 134, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
