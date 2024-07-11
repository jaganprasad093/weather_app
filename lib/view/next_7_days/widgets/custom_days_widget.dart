import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/core/constants/image_constants.dart';

class CustomDaysWidget extends StatelessWidget {
  const CustomDaysWidget({super.key});

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
                  "",
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
                      fit: BoxFit.fill,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
