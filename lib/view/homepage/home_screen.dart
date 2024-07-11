import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/next_controller.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/view/homepage/widget/custom_weather_indicator.dart';
import 'package:weather_app/view/homepage/widget/custom_weather_widget.dart';
import 'package:weather_app/view/next_7_days/next_seven_days.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomescreenController>().place();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomescreenController>();
    var kelvin = provider.resmodel?.main?.temp?.round();
    var celcus = kelvin! - 273;

    return Scaffold(
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                    backgroundColor: Color(0xFFfdb880),
                    leading: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    actions: [
                      Icon(
                        Icons.menu_open_rounded,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                    title: Row(
                      children: [],
                    )),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${context.read<HomescreenController>().places}," +
                                    "\n${context.read<HomescreenController>().locality}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 40),
                              ),
                              Text("Mon, jan 30",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: ColorConstants.primaryBlack
                                          .withOpacity(.4))),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/cludy.png",
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            Stack(children: [
                              Container(
                                width: 170,
                                height: 80,
                                child: Text(
                                  "${celcus}",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 0,
                                child: Text("°C"),
                              ),
                              Positioned(
                                  bottom: 0,
                                  child: Text(
                                      "${provider.resmodel?.weather?.first.description}"))
                            ])
                          ],
                        ),
                        CustomWeatherWidget(),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Tommorow",
                              style: TextStyle(),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NextSevenDays(),
                                    ));
                              },
                              child: Text(
                                "Next 7 days  >",
                                style: TextStyle(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 100,
                          // width: 4,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  CustomWeatherIndicator(),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 10,
                                  ),
                              itemCount: 10),
                        )
                        // CustomWeatherIndicator()
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
