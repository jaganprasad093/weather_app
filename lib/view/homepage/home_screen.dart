import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/homescreen_controller.dart';
import 'package:weather_app/controller/search_controller.dart';
import 'package:weather_app/core/constants/color_constants.dart';
import 'package:weather_app/view/homepage/search_screen/search_screen.dart';
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
    initload();
    super.initState();
  }

  void initload() async {
    // var provider = context.read<SearchScreenController>();
    // var current_position = provider.formattedAddress;
    // await context.read<SearchScreenController>().current_location();
    // await context.read<SearchScreenController>().getCurrentPosition();
    // await context.read<SearchScreenController>().addSearch(current_position);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchScreenController>();
    var kelvin = provider.resmodel?.main?.temp?.round() ?? 273;
    var celcus = kelvin - 273;
    String datefr = DateFormat("EEE, MMM d").format(DateTime.now());

    return Scaffold(
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                    backgroundColor: Color(0xFFfdb880),
                    leading: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ));
                      },
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
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
                                "${provider.resmodel?.name}",
                                // "${context.read<HomescreenController>().places}," +
                                //     "\n${context.read<HomescreenController>().locality}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 40),
                              ),
                              Text(datefr,
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
                            SizedBox(
                              width: 10,
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
