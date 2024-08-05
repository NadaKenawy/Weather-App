import 'package:weather_application/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;
  WeatherLoadedState({required this.weather});
}

class WeatherFailureState extends WeatherState {}
