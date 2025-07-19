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
      create: (_) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: const WeatherRootScreen(),
      ),
    );
  }
}

class WeatherRootScreen extends StatelessWidget {
  const WeatherRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(WeatherState state) {
    if (state is WeatherLoadedState) {
      return const InfoWeatherData(key: ValueKey('info'));
    } else if (state is NoWeatherState) {
      return const NoWeatherData(key: ValueKey('no-data'));
    } else {
      return const Center(
        key: ValueKey('error'),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 64),
              SizedBox(height: 16),
              Text(
                'حدث خطأ أثناء تحميل الطقس!\nيرجى المحاولة لاحقاً.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
    }
  }
}
