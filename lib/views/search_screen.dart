import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) async {
                //يتم استخدامها لاستقبال قيمة من المستخدم طول ما المستخدم بيكتب
              //  log(weatherModel!.cityName);
                Navigator.of(context).pop();
              var  getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value); 
                log(value);
              },
              decoration: InputDecoration(
                hintText: "Serch your City",
                labelText: 'search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


