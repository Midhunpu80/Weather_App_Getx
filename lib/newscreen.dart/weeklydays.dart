import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:weather_app/Models/hourly_weather_Model.dart';
// ignore: unused_import
import 'package:weather_app/newscreen.dart/todayweather.dart';
import 'package:weather_app/widgets/getxcontroller.dart';

// ignore: must_be_immutable
class weeklydays extends StatelessWidget {
  // ignore: non_constant_identifier_names

  controll controller = Get.put(controll());
  HourlyWeatherData? b;

  // var time = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(
  //     is_null!.list![index].dt!.toInt() * 1000));

  // ignore: unnecessary_new}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        height: 420,
        width: 50,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 133, 133, 133),
              offset: Offset(
                2.0,
                2.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(35),
          color: Colors.white,
        ),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                "Future Weather",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 340,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var days = DateFormat().add_EEEE().format(
                        DateTime.fromMillisecondsSinceEpoch(
                            controller.is_null!.list![index].dt!.toInt()*10000));
                    // dynamic date = DateFormat.EEEE(
                    //     is_null?.list![index].main!.temp!.toDouble());

                    // int dates = date * 1000;

                    return Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          // Image.asset('images/weather/${controller.is_null!.list![index].weather![0].icon}.png',width: 50,height: 10,),
                          FittedBox(
                            child: Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: controller.is_null?.list != null
                                          ? AssetImage(
                                              'images/weather/${controller.is_null?.list![index].weather?[0].icon}.png')
                                          : const AssetImage(
                                              "images/weather/01n.png"))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Text(
                              "${controller.is_null?.list?[index].main?.temp!.toInt()}🌡°c  ",
                              style: const TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              days,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Color.fromARGB(255, 255, 255, 255),
                    );
                  },
                  itemCount: controller.is_null!.list!.length > 5
                      ? 5
                      : controller.is_null!.list!.length,
                ))
          ],
        ),
      ),
    );
  }
}
