import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weather_cubit.dart';
import 'package:weatherapp/homepage.dart';
import 'package:weatherapp/provider/WeatherProvider.dart';
import 'package:weatherapp/services/weather_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(WeatherService()),
      child: const WeatherApp(), // ← هنا أضفنا child صح
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Weatherprovider(),
      child: MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
