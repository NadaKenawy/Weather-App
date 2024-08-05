import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_application/views/search_view.dart';
import 'package:weather_application/widgets/error_body.dart';
import 'package:weather_application/widgets/no_weather_body.dart';
import 'package:weather_application/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weather: state.weather,
              );
            } else if (state is WeatherLoadedState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ErrorBody(
                onRetry: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}


