import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/next_controller.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/core/constants/image_constants.dart';

class CustomWeatherWidget extends StatelessWidget {
  const CustomWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomescreenController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstants.primary_grey,
            ),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConstants.rainfall,
                      fit: BoxFit.fill,
                      height: 100,
                    ),
                    Text(
                      "RainFall",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Text("" + " cm", style: TextStyle(fontSize: 18))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstants.primary_grey,
            ),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageConstants.wind,
                      fit: BoxFit.fill,
                      height: 100,
                    ),
                    Text(
                      "Wind",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Text("${provider.resmodel?.wind?.speed}" + " m/s",
                    style: TextStyle(fontSize: 18))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstants.primary_grey,
            ),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.humidity,
                      fit: BoxFit.fill,
                      height: 60,
                    ),
                    Text(
                      "Humidity",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Text("${provider.resmodel?.main?.humidity}%",
                    style: TextStyle(fontSize: 18))
              ],
            ),
          )
        ],
      ),
    );
  }
}
