import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/widgets/theme_color.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;
  const WeatherInfoBody({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel!.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[200]!,
            getThemeColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(228, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel.image}",
                  height: 100,
                  width: 100,
                ),
                Text(
                  '${weatherModel.temp}°C',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 44,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Max: ${weatherModel.maxTemp.round()}°C',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(228, 255, 255, 255),
                      ),
                    ),
                    Text(
                      'Min: ${weatherModel.minTemp.round()}°C',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(228, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
