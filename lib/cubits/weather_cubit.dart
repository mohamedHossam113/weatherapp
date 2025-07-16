import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weaher_cubit/weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  String? cityname;
  WeatherModel? weatherModel;
  void getWeather({required String cityname}) async {
    emit(WeatherLoading());
    // Simulate a network call to fetch weather data
    try {
      weatherModel = await weatherService.getWeather(cityname: cityname);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
      log('Error:  $e');
    }
  }
}
