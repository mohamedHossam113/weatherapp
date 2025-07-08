import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/WeatherProvider.dart';
import 'package:weatherapp/searchpage.dart';

class Homepage extends StatefulWidget {
   const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    WeatherModel? weatherData;

  void updateUI(){
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<Weatherprovider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('   Weather App',style: TextStyle(fontSize: 20,color:Colors.white)),
        actions: [
          IconButton(onPressed: (){
            updateUI();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
return Searchpage(
  updateUI: updateUI,

            );
            }
            
            ));
          }, icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.lightBlue,
      ),
      
    body:  Provider.of<Weatherprovider>(context ,listen: true).weatherData== null
    ? 
    const Center( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Spacer(flex: 1),
          Text(
            'there is no weather 😔',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Search now.🔍',
            style: TextStyle(fontSize: 30),
          ),
          Spacer(flex: 1)
        ],
      ),
    ):
    Container(
      color: Color(0xFFFFE53B),
      child: Center(
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(Provider.of<Weatherprovider>(context).cityname ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 55,
                fontWeight: FontWeight.bold
                    
              ),),
              Text(
                'updated at : ${weatherData != null ? DateTime.parse(weatherData!.date).hour.toString() : '--'}:${weatherData != null ? DateTime.parse(weatherData!.date).minute.toString() : '--'}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Spacer(flex: 1),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Image.asset(weatherData!.getImage()),
        
             Text(
  Provider.of<Weatherprovider>(context).weatherData?.temp ?? '--',
  style: const TextStyle(
    fontSize: 35,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
),

              const Column(children: 
              [
                Text('MaxTemp =30',
                style: TextStyle(
                  fontSize: 15
                ),),
                Text('MinTemp = 15',
                style: TextStyle(
                  fontSize: 15,
                ),)
              ],)
            ],),
             const Spacer(flex: 1),
            Text(
              weatherData?.weatherState ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
           ),
           ),
           const Spacer(flex:3),
           ],
          ),
        ),
      ),
    ),
    
    );
}
}