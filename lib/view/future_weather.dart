import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/newscreen.dart/fut_today.dart';
import 'package:weather_app/newscreen.dart/weeklydays.dart';
  DateTime date = new DateTime.now();

// ignore: use_key_in_widget_constructors, must_be_immutable, camel_case_types
 Future_day_weather(BuildContext context){ 

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 103, 70, 235),
                  Color.fromARGB(255, 232, 232, 232)
                ]),
            color: Colors.red,
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 25,
                            color: Colors.white,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 60),
                              child: Text(
                                "Future Weather",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Text(
                    DateFormat.yMMMd().format(date),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              fut_today(),
         weeklydays()
            ],
          )),
    );
  }

