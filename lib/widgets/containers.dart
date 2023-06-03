import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/getxcontroller.dart';

Widget continerss(
    // ignore: non_constant_identifier_names
    // required Colors,
    {
    required dynamic index}) {
  controll cont = Get.put(controll());

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: Color.fromARGB(255, 198, 255, 255)),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 18, 113, 255),
              Color.fromARGB(255, 255, 171, 199)
            ]),
        borderRadius: BorderRadius.circular(40),
        // color: Colors,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 175, 178, 176),
            offset: Offset(
              10.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38),
            child: Container(
              height: 120,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/weather/${cont.is_null?.list![index].weather![0].icon}.png",
                    ),
                    fit: BoxFit.cover),
              ),
            
              ///color: Colors.amber,
            ),
          ),
          Text(
          "${cont.is_null?.list?[index].wind!.gust}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 48, color: Colors.white),
          ),
          // ignore: prefer_const_constructors
          Text(
                      "Max${cont.is_null?.list?[index].main!.tempMax} °/Min${cont.is_null?.list![index].main?.tempMin} °",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

sbox({required double width}) {
  return sbox(width: width);
}

Widget conatiner2({required double height, required double width}) {
  return Container(
    height: height,
    width: width,
    color: const Color.fromARGB(255, 255, 255, 255),
  );
}
