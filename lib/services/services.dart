import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';
class WeatherService
{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'ffc51c42b7574a1184a64215252406';
  Future<WeatherModel> getWeather({required String cityname}) async{
    Uri url = Uri.parse('$baseUrl/current.json?key=$apiKey&q=$cityname&aqi=no');
    http.Response response = await http.get(url);

   Map<String, dynamic> data= jsonDecode(response.body); 
   WeatherModel weather =WeatherModel.fromJson(data);
    
return weather;

  }
}