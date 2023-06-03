// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, depend_on_referenced_packages, must_be_immutable, prefer_typing_uninitialized_variables
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Models/hourly_weather_Model.dart';
import 'package:weather_app/Models/weather_api.dart';
import 'package:weather_app/newscreen.dart/newelements.dart';
import 'package:weather_app/newscreen.dart/wether_conatiner.dart';
import 'package:weather_app/service/api.dart';
import 'package:weather_app/service/hourly_weather.dart';
// ignore: unused_import
import 'package:weather_app/widgets/containers.dart';
import 'package:weather_app/widgets/getxcontroller.dart';

WeatherApi? isnull;

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unnecessary_new
  DateTime now = new DateTime.now();

  var time = DateTime.now();

  late Future<WeatherApi> currendata;
  late Future<HourlyWeatherData> currenthour;

  @override
  void initState() {
    getCurrrentData();

    super.initState();

    // ignore: unused_local_variable
  }

  // ignore: unused_field
  final TextEditingController _controller = TextEditingController();
  WeatherApi? a;

  HourlyWeatherData? b;
  Future<void> getCurrrentData() async {
    currendata = getCurrentCityWeather();
    currenthour = getcurrent_hourly_weather();
    setState(() {});
  }

  controll controller = Get.put(controll());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          // ignore: avoid_unnecessary_containers
          body: FutureBuilder<WeatherApi>(
              future: currendata,
              builder: (context, AsyncSnapshot<WeatherApi> snapshot) {
                // if (snapshot.data == null) {
                //   return Center(child: const CircularProgressIndicator());
                // }
                if (a == null) {
                  isnull = snapshot.data;

                  ///  SizedBox();
                } else {
                  isnull = a;
                }

                return !snapshot.hasData
                    ? Center(child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset("images/lt.json")))
                    : SizedBox(
                        height: 800,
                        child: ListView(
                          children: [
                            Container(
                              height: 80,
                              width: 50,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30),
                              child: TextFormField(
                                controller: controller.contr_oller.value,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintText: "Search city",
                                    fillColor: Colors.grey,
                                    // prefixIcon: Icon(Icons.location_city),
                                    // suffixIcon:  Icon(Icons.search),
                                    enabled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(

                                  ///  onHover: Colors.red,
                                  onPressed: () async {
                                    a = await getCurrentCityWeather2(controller
                                        .contr_oller.value.text
                                        .trimRight());

                                    b = await gethourlyCity_Weather2(controller
                                        .contr_oller.value.text
                                        .trimRight());

                                    Get.snackbar("Weather",
                                        "Weather changed now the location is :${a?.name.toString()}",
                                        backgroundColor: Colors.blue,
                                        colorText: Colors.white,
                                        backgroundGradient:
                                            const LinearGradient(colors: [
                                          Colors.blueAccent,
                                          Colors.greenAccent
                                        ]));

                                    ///print("temp${a?.main.pressure}");
                                    // getCurrrentData();
                                    getCurrrentData();
                                  },
                                  style: ElevatedButton.styleFrom(),
                                  child: const Text("Search")),
                            ),
                            Container(
                              height: 107,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    " ${isnull?.name ?? "error"}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("${DateFormat.jm().format(now)}"),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 34,
                                    width: 150,
                                    // ignore: sort_child_properties_last
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, top: 5),
                                      child:
                                          Text(DateFormat.yMMMd().format(now)),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 200, 210, 205),
                                            offset: Offset(
                                              1.0,
                                              2.0,
                                            ),
                                            blurRadius: 10.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(60),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                  )
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Weather_conatiner(
                                  b: b,
                                  
                                ),
                                // Positioned(bottom: 450, child: Weather_conatiner2()),
                                Positioned(
                                  bottom: 220,
                                  left: 30,
                                  child: Weather_conatiner3(
                                      humidity:
                                          isnull?.main?.humidity.toString(),
                                      wint: isnull?.wind?.speed.toString(),
                                      pressure:
                                          isnull?.main?.pressure.toString(),
                                      velocity:
                                          " ${isnull?.main?.tempMax!.toInt().toString()}°"),
                                )
                              ],
                            )
                          ],
                        ),
                      );
              })),
    );
  }
}
