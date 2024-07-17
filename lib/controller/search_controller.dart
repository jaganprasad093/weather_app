import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class SearchScreenController with ChangeNotifier {
  bool isLoading = false;
  WeatherAppModel? resmodel;
  String? places;
  String? locality;
  var res_null;
  var lat;
  var lon;
  String? formattedAddress;
  String text = "could not fetch the looation";
  String? location_;
  addSearch(
    var search_location,
  ) async {
    log("print location sts:$location_");
    var domain = "https://api.openweathermap.org/data/2.5/weather?";
    var apikey = "5d399a2374c6fb926169f5115d9a8717";

    if (location_ == null) {
      isLoading = true;

      // notifyListeners();
      Uri url = Uri.parse('${domain}lat=$lat&lon=$lon&appid=$apikey');

      var res = await http.get(url);
      log("${res.request}");
      log("${search_location}");
      if (res.statusCode == 200) {
        var decodedData = jsonDecode(res.body);
        resmodel = WeatherAppModel.fromJson(decodedData);
        log("location 1 -------$location_");
        log(resmodel?.name ?? "");
        notifyListeners();
        log("sucess 1-- api fetched");
      } else {
        log("failed 1 -- api fetch");
      }
      location_ = "kochi";

      isLoading = false;
    } else {
      // isLoading = true;
      // notifyListeners();
      location_ = search_location;
      log("location  2---$location_");
      Uri url = Uri.parse('${domain}q=$location_&appid=$apikey');

      var res = await http.get(url);
      log("${res.request}");
      log("${res.body}");
      log("${search_location}");
      if (res.statusCode == 200) {
        var decodedData = jsonDecode(res.body);
        resmodel = WeatherAppModel.fromJson(decodedData);
        res_null = resmodel;
      } else {
        res_null = resmodel;
        res_null = null;

        log("res model---$resmodel, api fetch failed");
      }
      // isLoading = false;
      notifyListeners();
    }
  }

  place() async {
    List<Placemark> placemarks_ = await placemarkFromCoordinates(
        resmodel?.coord?.lat ?? 1.324324324, resmodel?.coord?.lon ?? 6.9437819);

    places = placemarks_.first.locality;
    locality = placemarks_.first.administrativeArea;
    log("place---$place");
    notifyListeners();
    return places;
  }

// --------------  current location   -----------------

  Future<bool> current_location() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled. Please enable the services
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Location permissions are denied
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, we cannot request permissions.

      return false;
    }
    return true;
  }

  Future<String?> getCurrentPosition() async {
    try {
      final hasPermission = await current_location();
      if (!hasPermission) return null;

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      lat = position.latitude;
      lon = position.longitude;
      log("Position: $position");
      // List<Placemark> placeMarks =
      //     await placemarkFromCoordinates(position.latitude, position.longitude);
      // Placemark place = placeMarks[0];

      // // log("placeeee---${place}");
      // formattedAddress = "${place.street}, ${place.subLocality}";
      // log("Address: $formattedAddress");
      // log("Address---------------: ${place.subLocality}");

      notifyListeners();
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }
}
