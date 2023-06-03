// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Weather_conatiner3 extends StatelessWidget {
  var humidity;

  var wint;
  var pressure;

  var velocity;

  Weather_conatiner3(
      {required this.humidity,
      required this.wint,
      required this.pressure,
      required this.velocity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 330,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 89, 95, 92),
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.circular(19),
          // ignore: prefer_const_constructors
          color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weathericons(jav: Icons.water_drop),
              weathericons(jav: Icons.air),
              weathericons(jav: Icons.model_training_outlined),
              weathericons(jav: Icons.thermostat),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textmeters(name: humidity),
                const SizedBox(
                  width: 1,
                ),
                textmeters(name: wint),
                const SizedBox(
                  width: 1,
                ),
                textmeters(name: pressure),
                const SizedBox(
                  width: 1,
                ),
                textmeters(name: velocity),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textwinters(name: "Humidity"),
                textwinters(name: "wint"),
                textwinters(name: "pressure"),
                textwinters(name: "Temp"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textwinters({required String name}) {
    return Text(
      name,
      // ignore: prefer_const_constructors
      style: TextStyle(color: Colors.grey, fontSize: 10),
    );
  }

  Widget textmeters({required String name}) {
    return Text(
      name,
      // ignore: prefer_const_constructors
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
    );
  }

  Widget weathericons({required IconData jav}) {
    return Icon(
      jav,
      size: 20,
      color: Colors.blueAccent,
    );
  }
}
