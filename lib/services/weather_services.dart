import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService{

  final Dio dio ;
   final String baseUrl = 'https://api.weatherapi.com/v1';
   final String apiKey = '6bce79a398904196b0d84537251907';
  WeatherService(this.dio,);

  Future <WeatherModel?> getCurrentWeather({required String cityName})async{

    try{
      Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
      // if(response.statusCode ==200){
      //   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      //   return weatherModel;
      // }else{
      //   final messageError = response.data['error']['message'];
      //   throw Exception(messageError);
      // }


    } on DioException catch(e){
      final messageError = e.response?.data['error']['message'] ?? "oops there was an error😢";
      throw Exception(messageError);
    }catch(e){
      log(e.toString());
      throw Exception('try later');
    }



  }

}