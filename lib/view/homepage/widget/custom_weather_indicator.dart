import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/core/constants/image_constants.dart';

class CustomWeatherIndicator extends StatelessWidget {
  const CustomWeatherIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorConstants.primary_grey),
      child: Column(
        children: [
          Text("now"),
          Image.asset(
            ImageConstants.sun,
            height: 40,
            fit: BoxFit.fill,
          ),
          Text(
            "90°",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
