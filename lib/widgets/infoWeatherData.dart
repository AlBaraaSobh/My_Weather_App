import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../../models/weather_model.dart';
import '../views/search_screen.dart';

class InfoWeatherData extends StatelessWidget {
  const InfoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherModel = context.read<GetWeatherCubit>().weatherModel;
    final date = DateTime.parse(weatherModel.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.lightBlueAccent.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(20),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherModel.cityName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Updated at ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        "https:${weatherModel.img}",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          BoxedIcon(WeatherIcons.thermometer),
                          const SizedBox(height: 5),
                          Text(
                            "${weatherModel.temp.round()}°C",
                            style: const TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              BoxedIcon(WeatherIcons.day_sunny),
                              const SizedBox(width: 8),
                              Text("Max: ${weatherModel.maxTemp.round()}°C"),
                            ],
                          ),
                          Row(
                            children: [
                              BoxedIcon(WeatherIcons.night_clear),
                              const SizedBox(width: 8),
                              Text("Min: ${weatherModel.minTemp.round()}°C"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    weatherModel.weatherCondition,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
// import 'package:weather/models/weather_model.dart';
// import '../views/search_screen.dart';
//
// class InfoWeatherData extends StatelessWidget {
//   const InfoWeatherData({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text(
//           "Weather App",
//         ),
//         actions: [
//           Padding(
//               padding: EdgeInsets.only(right: 20),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return SearchScreen();
//                       },
//                     ),
//                   );
//                 },
//                 icon: Icon(Icons.search),
//               )),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: AlignmentDirectional.topEnd,
//               end: AlignmentDirectional.bottomEnd,
//               colors: [
//                 Colors.blue.shade500,
//                 Colors.blue.shade300,
//                 Colors.blue.shade200,
//
//               ]),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 weatherModel.cityName,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 32,
//                 ),
//               ),
//               Text(
//                 "update at ${stringToDate(weatherModel.date).hour}: ${stringToDate(weatherModel.date).minute } ",
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.network(
//                     "https:${weatherModel.img}"
//
//
//                   ),
//                   Text(weatherModel.temp.toString()
//                   ),
//                   Column(
//                     children: [
//                       Text("Maxtemp: ${weatherModel.maxTemp.round()}"),
//                       Text("Mintemp: ${weatherModel.minTemp.round()}")
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 weatherModel.weatherCondition,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 32,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// DateTime stringToDate(String value){
// return DateTime.parse(value);
// }