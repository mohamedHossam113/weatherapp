import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weatherprovider extends ChangeNotifier{
  WeatherModel? _weatherData;
  String? cityname;
set weatherData(WeatherModel? weather){
  _weatherData = weather;
  notifyListeners();
} 

WeatherModel? get weatherData => _weatherData; 
}