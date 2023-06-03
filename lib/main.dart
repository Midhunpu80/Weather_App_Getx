import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:weather_app/location/location.dart';

import 'package:weather_app/view/Home.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/widgets/getxcontroller.dart';
import 'package:weather_app/widgets/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(controll());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: GoogleFonts.inder().fontFamily, useMaterial3: true),
      home: Scaffold(
        body: Splashscreen(),
      ),
    );
  }
}
