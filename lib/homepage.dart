import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weaher_cubit/weather_state.dart';
import 'package:weatherapp/cubits/weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/WeatherProvider.dart';
import 'package:weatherapp/searchpage.dart';

class Homepage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('   Weather App',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Searchpage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            final cityname = BlocProvider.of<WeatherCubit>(context).cityname;
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuccessBody(cityname: cityname, weatherData: weatherData);
          } else if (state is WeatherFailure) {
            return const Center(child: Text('Error loading weather data'));
          } else {
            return const DefaultBody();
          }
        },
      ),
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          Text(
            'There is no weather 😔',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Search now. 🔍',
            style: TextStyle(fontSize: 30),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.cityname,
    required this.weatherData,
  });

  final String? cityname;
  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlue, Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityname ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'updated at : ${weatherData != null ? DateTime.parse(weatherData!.date).hour.toString() : '--'}:${weatherData != null ? DateTime.parse(weatherData!.date).minute.toString() : '--'}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(weatherData!.getImage()),
                  Text(
                    weatherData!.temp,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        'MaxTemp = 30',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'MinTemp = 15',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(flex: 1),
              Text(
                weatherData!.weatherState,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
