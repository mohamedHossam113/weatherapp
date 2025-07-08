import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/WeatherProvider.dart';
import 'package:weatherapp/services/services.dart';

// ignore: must_be_immutable
class Searchpage extends StatelessWidget {
   Searchpage({super.key,this.cityname, required this.updateUI});
   String? cityname;
   VoidCallback? updateUI;
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      appBar: AppBar(
        title: const Text('   Search a City',style: TextStyle(fontSize: 20,color:Colors.white)),
        backgroundColor: const Color.fromARGB(255, 232, 179, 43),
      ),
    body:  Center(child: Column( children: [
      const Spacer(flex: 1,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (data)async{
            cityname = data;
            WeatherService service =WeatherService();
            WeatherModel weather = 
            await service.getWeather(cityname: cityname!);
            // weatherData = weather;
            Provider.of<Weatherprovider>(context, listen: false).weatherData = weather;
            Provider.of<Weatherprovider>(context, listen: false).cityname = cityname;
            Navigator.pop(context);
            print('the data provided is ${cityname }');
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 24),
            label: Text('search'),
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Enter a city'
          ),
        ),
      ),
      const Spacer(flex: 2),
    ],
    )),
    );
  }
}