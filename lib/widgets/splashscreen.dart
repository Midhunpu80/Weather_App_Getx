import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/view/Home.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    accesd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 230, left: 120, right: 50),
                child: Lottie.asset("images/Z.json", fit: BoxFit.cover)),
          ],
        ));
  }

  accesd() async {
    await Future.delayed(Duration(seconds: 6));
    Get.to(Home());
  }
}
