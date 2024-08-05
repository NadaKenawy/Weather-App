import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_application/Services/weather_service.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_application/models/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel  = await WeatherService(Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weather: weatherModel!));
    } on Exception {
      emit(WeatherFailureState());
    }
  }
}
