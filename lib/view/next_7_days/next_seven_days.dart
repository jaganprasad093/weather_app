import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/core/constants/image_constants.dart';
import 'package:weather_app/view/next_7_days/widgets/custom_tommorow_weather.dart';

class NextSevenDays extends StatefulWidget {
  const NextSevenDays({super.key});

  @override
  State<NextSevenDays> createState() => _NextSevenDaysState();
}

class _NextSevenDaysState extends State<NextSevenDays> {
  final List<String> Days = [
    "Monday",
    "Tuesday",
    "Wedsday",
    "Tursday",
    "Friday",
    "Saturaday",
    "Sunday",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        title: Text(
          "Next 7 Days",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTommorowWeather(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 700,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConstants.primary_grey,
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Days[index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "22" + "°",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 7),
            )
          ],
        ),
      ),
    );
  }
}
