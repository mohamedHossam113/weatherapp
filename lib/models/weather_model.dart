import 'dart:convert';

import 'package:flutter/material.dart';

class WeatherModel{
   late String date; 
   late String temp;
   late String weatherState;

  WeatherModel({required this.date, required this.temp, required this.weatherState});
  WeatherModel.fromJson(dynamic json)
      : date = json['location']?['localtime'] ?? '',
        temp = json['current']?['temp_c']?.toString() ?? '',
        weatherState = json['current']?['condition']?['text'] ?? '';

  @override
  String toString() {
    return 'tem = $temp   date = $date  weatherState = $weatherState';
  }
   String getImage() {
    if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (
        
        weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState == 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
MaterialColor getThemeColor() {
    if (weatherState == 'Sunny' || weatherState == 'Clear' ||  weatherState == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weatherState == 'Blizzard' ||  weatherState == 'Patchy snow possible'  ||  weatherState == 'Patchy sleet possible' || weatherState == 'Patchy freezing drizzle possible' || weatherState == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherState == 'Freezing fog' || weatherState == 'Fog' ||  weatherState == 'Heavy Cloud' || weatherState == 'Mist' || weatherState == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers	') {
      return Colors.blue;
    } else if (weatherState == 'Thundery outbreaks possible' || weatherState == 'Moderate or heavy snow with thunder' || weatherState == 'Patchy light snow with thunder'|| weatherState== 'Moderate or heavy rain with thunder' || weatherState == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

  
}
