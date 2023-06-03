import 'package:flutter/material.dart';
import 'package:weather_app/view/Home.dart';

class fut_today extends StatelessWidget {
  // WeatherApi cel;
  // WeatherApi cloud;
  // fut_today({required this.cel, required this.cloud});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
      child: Container(
        height: 180,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromARGB(85, 205, 210, 206),
            border: Border.all(width: 3, color: Colors.white)),
        child: Stack(
          children: [
            FittedBox(
              child: Positioned(
                  top: 40,
                  left: 30,
                  child: Container(
                    height: 110,
                    width: 150,

                    ///  color: const Color.fromARGB(255, 192, 190, 185),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/weather/${isnull!.weather![0].icon}.png'),
                            fit: BoxFit.contain)),
                  )),
            ),
            Positioned(
                top: 22,
                left: 190,
                child: Text(
                  "${isnull!.main!.temp.toString()}°C",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                )),
            Positioned(
                top: 122,
                left: 195,
                child: Text(
                  isnull!.clouds.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}
