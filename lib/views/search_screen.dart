import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text(
          'Search for the city',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter the city name :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  _handleSearch(context, value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'City name',
                  hintText: 'Example: Jerusalem, Cairo, Paris...',
                  prefixIcon: const Icon(Icons.location_city),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _handleSearch(context, controller.text);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSearch(BuildContext context, String cityName) {
    if (cityName.trim().isEmpty) return;

    context.read<GetWeatherCubit>().getWeather(cityName: cityName);
    Navigator.pop(context);
  }
}


// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
// import '../models/weather_model.dart';
// import '../services/weather_services.dart';
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search City'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onSubmitted: (value) async {
//                 //يتم استخدامها لاستقبال قيمة من المستخدم طول ما المستخدم بيكتب
//               //  log(weatherModel!.cityName);
//                 Navigator.of(context).pop();
//               var  getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
//               getWeatherCubit.getWeather(cityName: value);
//                 log(value);
//               },
//               decoration: InputDecoration(
//                 hintText: "Serch your City",
//                 labelText: 'search',
//                 suffixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.blue,
//                       width: 3,
//                     ),
//                     borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
