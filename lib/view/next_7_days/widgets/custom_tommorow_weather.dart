import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/core/constants/image_constants.dart';

class CustomTommorowWeather extends StatelessWidget {
  const CustomTommorowWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.primary_grey,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tommorow",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "22" + "°",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      ImageConstants.cloud_sun,
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    height: 80,
                    child: Image.asset(
                      ImageConstants.rainfall,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      "1" + " cm",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    bottom: 0,
                    right: 20,
                  )
                ]),
                Stack(children: [
                  Container(
                    height: 80,
                    child: Image.asset(
                      ImageConstants.wind,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      "20" + " km",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    bottom: 0,
                    right: 20,
                  )
                ]),
                SizedBox(
                  width: 5,
                ),
                Stack(children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                  ),
                  Positioned(
                    child: Text(
                      "30" + " %",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    bottom: 0,
                    left: 10,
                  ),
                  Positioned(
                      top: 17,
                      right: 30,
                      child: Container(
                        height: 60,
                        child: Image.asset(
                          ImageConstants.humidity,
                          fit: BoxFit.fill,
                        ),
                      ))
                ]),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
