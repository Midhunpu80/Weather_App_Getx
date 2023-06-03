// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/hourly_weather_Model.dart';

const apikey2 = "8c0045d7560ca2bdb4268c20a959570d";
const  lat2 = '11.1557';
const  long2 = '75.8912';
const String domain2 = 'https://api.openweathermap.org/data/2.5/forecast?';

Future< HourlyWeatherData> getcurrent_hourly_weather() async {
  final uri2 =  Uri.parse(
      '${domain2}lat=$lat2&lon=$long2&appid=$apikey2&&units=metric');

  final response = await http.get(uri2);
  if (response.statusCode == 200) {
    final jsonResponse =  response.body;

    final weatherApi =  HourlyWeatherData.fromJson(jsonDecode(jsonResponse));
    return weatherApi; // Assuming hourlyWeatherFromJson is defined correctly
  } else {
    print("not received");
    throw Exception('Failed to fetch weather data.');
  }
}



gethourlyCity_Weather2(String city) async {
  final uri2 = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apikey2&&units=metric');

  final response = await http.get(uri2);
  if (response.statusCode == 200) {
    final jsonResponse = response.body;

    final weatherApi =  HourlyWeatherData.fromJson(jsonDecode(jsonResponse));
    return weatherApi;
  } else {
    // ignore: avoid_print
    print("not recived");

    throw ('Failed to fetch weather data.');
  }
}
