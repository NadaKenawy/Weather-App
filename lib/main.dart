import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_application/views/home_view.dart';
import 'package:weather_application/widgets/theme_color.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
                textTheme:
                    GoogleFonts.acmeTextTheme(Theme.of(context).textTheme),
                appBarTheme: AppBarTheme(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}
