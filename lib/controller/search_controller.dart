import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class SearchController with ChangeNotifier {
  bool isLoading = false;
  WeatherAppModel? resmodel;
  search() async {
    isLoading = true;
    notifyListeners();

    Uri url = Uri(scheme: 'https', host: "");

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
}
