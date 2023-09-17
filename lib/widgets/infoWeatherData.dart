import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import '../views/search_screen.dart';

class InfoWeatherData extends StatelessWidget {
  const InfoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Weather App",
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.search),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Colors.blue.shade500,
                Colors.blue.shade300,
                Colors.blue.shade200,

              ]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                "update at ${stringToDate(weatherModel.date).hour}: ${stringToDate(weatherModel.date).minute } ",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https:${weatherModel.img}"


                  ),
                  Text(weatherModel.temp.toString()
                  ),
                  Column(
                    children: [
                      Text("Maxtemp: ${weatherModel.maxTemp.round()}"),
                      Text("Mintemp: ${weatherModel.minTemp.round()}")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

DateTime stringToDate(String value){
return DateTime.parse(value);
}