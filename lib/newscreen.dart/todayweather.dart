// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/hourly_weather_Model.dart';
import 'package:weather_app/view/Home.dart';
import 'package:weather_app/widgets/getxcontroller.dart';

class today_weather extends StatelessWidget {
  today_weather(this.b);

  controll controller = Get.put(controll());
  final HourlyWeatherData? b;

  Home home = Home();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HourlyWeatherData>(
      future: controller.gethourdata,
      builder: (context, AsyncSnapshot<HourlyWeatherData> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (b == null) {
          controller.is_null = snapshot.data;
        } else {
          controller.is_null = b;
        }

        return Padding(
          padding: const EdgeInsets.only(top: 1, left: 2, right: 2),
          child: Container(
            height: 130,
            width: 100,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 231, 238, 235),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var time = DateFormat.jm().format(
                  DateTime.fromMillisecondsSinceEpoch(
                    controller.is_null!.list![index].dt!.toInt() * 1000,
                  ),
                );
                return Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(29),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        time,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 96, 91, 91),
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "images/weather/${controller.is_null?.list![index].weather?[0].icon}.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        "${controller.is_null?.list![index].main?.temp}°C",
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 14,
              ),
              itemCount: controller.is_null!.list!.length > 5
                  ? 5
                  : controller.is_null!.list!.length,
            ),
          ),
        );
      },
    );
  }
}
