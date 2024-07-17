import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/search_controller.dart';
import 'package:weather_app/view/homepage/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initload();
    super.initState();
  }

  void initload() async {
    var provider = context.read<SearchScreenController>();
    var current_position = provider.formattedAddress;
    await context.read<SearchScreenController>().current_location();
    await context.read<SearchScreenController>().getCurrentPosition();
    context.read<SearchScreenController>().addSearch(current_position);

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("spalsh screen")),
    );
  }
}
