// ignore_for_file: sized_box_for_whitespace, camel_case_types, duplicate_ignore

// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Models/hourly_weather_Model.dart';
import 'package:weather_app/newscreen.dart/todayweather.dart';
import 'package:weather_app/view/future_weather.dart';
import 'package:weather_app/widgets/containers.dart';
import 'package:weather_app/widgets/getxcontroller.dart';
// import 'package:flutter/src/widgets/icon.dart';
// import 'package:weather_app/Models/hourly_weather_Model.dart';

// ignore: must_be_immutable
class Weather_conatiner extends StatelessWidget {
  HourlyWeatherData? b;

 
  // WeatherApi cel;
  // WeatherApi cloud;


controll con= Get.put(controll());

  

  // ignore: use_key_in_widget_constructors
  Weather_conatiner({ required this.b,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Container(
        height: 630,
        width: 500,

      
        child: ListView(
          children: [
            SizedBox(
              height: 265,
              width: 50,

              //  color: const Color.fromARGB(255, 255, 255, 255),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return continerss(index: index);
                },
                itemCount:7 ,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 34,
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  height: 110,
                  width: 100,
                  color: const Color.fromARGB(192, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Today",
                              style: TextStyle(color: Colors.black),
                            )),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Future_day_weather(context)));
                          },
                          icon: Text(""),
                          label: const Text(
                            "Next 5 Days =>",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),

                  //  color: Color.fromARGB(255, 190, 255, 255),
                )),
            today_weather(b),
            Container(
              height: 10,
              width: 100,
              color: const Color.fromARGB(192, 255, 255, 255),
            )
          ],
        ),
      ),
    );
  }
}

// class Weather_conatiner2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 5,
//       width: 400,
//       decoration: const BoxDecoration(
//         color: Color.fromARGB(255, 198, 237, 255),
//       ),
//       child: Row(children: []),
//     );
//   }
// }

// ignore: camel_case_types, use_key_in_widget_constructors
