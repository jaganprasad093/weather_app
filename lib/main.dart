import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/homescreen_controller.dart';
import 'package:weather_app/controller/search_controller.dart';
import 'package:weather_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFfdb880)),
        home: SplashScreen(),
      ),
    );
  }
}
