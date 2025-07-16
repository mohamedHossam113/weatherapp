import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/WeatherProvider.dart';
import 'package:weatherapp/services/weather_service.dart';

// ignore: must_be_immutable
class Searchpage extends StatelessWidget {
  Searchpage({super.key, this.cityname});
  String? cityname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('   Search a City',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 232, 179, 43),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) async {
                cityname = data;
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityname: cityname!);
                BlocProvider.of<WeatherCubit>(context).cityname = cityname;
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                  label: Text('search'),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Enter a city'),
            ),
          ),
          const Spacer(flex: 2),
        ],
      )),
    );
  }
}
