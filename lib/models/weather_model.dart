class WeatherModel {
  final String cityName;
  final String img;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.img,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    //تحتوي على الماب الكبيرة
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
