import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/widgets/infoWeatherData.dart';
import 'package:weather/widgets/noWeatherData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
          home: BlocBuilder<GetWeatherCubit,WeatherState>(
            builder: (context,state){
              if(state is NoWeatherState){

                return NoWeatherData();
              }else if (state is WeatherLoadedState){
                  return InfoWeatherData(
                  );
              } else{
                return Text('Error😢😢😢');
              }
            },
          )

      ),
    );
  }
}
