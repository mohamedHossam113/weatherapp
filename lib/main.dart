import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/homepage.dart';
import 'package:weatherapp/provider/WeatherProvider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return Weatherprovider();
    },
      child: const MaterialApp(
        home: Homepage(),
      ),
    );
    }
    }