// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Models/hourly_weather_Model.dart';
import 'package:weather_app/Models/weather_api.dart';
// ignore: unused_import
import 'package:weather_app/location/location.dart';
import 'package:weather_app/service/api.dart';
import 'package:weather_app/service/hourly_weather.dart';
import 'package:weather_app/widgets/splashscreen.dart';

// ignore: camel_case_types
class controll extends GetxController {


  @override
  void onInit() {
    gethourdata = getcurrent_hourly_weather();

    // gethourdata = getCurrrentData();
    

    // TODO: implement onInit
    super.onInit();
  }

  var gethourdata;

  var getdata;
  var getlocatio;
  late Future<WeatherApi> currendata;
  Future< HourlyWeatherData>? currenthour;
  final contr_oller = TextEditingController().obs;
  // var a = Rx<WeatherApi?>(null);
  // var isnull = Rx<WeatherApi?>(null);
   HourlyWeatherData? is_null ;

  Future<void> getCurrrentData() async {
    currendata = getCurrentCityWeather();
    currenthour = getcurrent_hourly_weather();
    update();
  }
}
