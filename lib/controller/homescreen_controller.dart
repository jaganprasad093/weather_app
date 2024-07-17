import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class HomescreenController with ChangeNotifier {
  bool isLoading = false;
  WeatherAppModel? resmodel;
  String? places;
  String? locality;
  Future getData() async {
    isLoading = true;
    // notifyListeners();

    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=thrissur&appid=dc4438114971296030da35914a37a8d8");

    var res = await http.get(url);
    if (res.statusCode == 200) {
      var decodedData = jsonDecode(res.body);
      resmodel = WeatherAppModel.fromJson(decodedData);
      notifyListeners();
    } else {
      log("failed");
    }
    isLoading = false;
    notifyListeners();
  }

  // place() async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //       resmodel?.coord?.lat ?? 1.324324324, resmodel?.coord?.lon ?? 6.9437819);

  //   places = placemarks.first.locality;
  //   locality = placemarks.first.administrativeArea;
  //   // log("place---$placemarks");
  //   notifyListeners();
  //   return places;
  // }
}
