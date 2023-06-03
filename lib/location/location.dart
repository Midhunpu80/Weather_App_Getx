// import 'package:geolocator/geolocator.dart';

// class st {
//   static Position? p;

//   static getcurrentloaction() async {
//     try {
//       p = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         forceAndroidLocationManager: true,
//       );

//       if (p != null) {
//         print("latitude: ${p?.latitude}, longitude: ${p?.longitude}");
//       } else {
//         print("Location data is unavailable.");
//       }
//     } catch (e) {
//       print("Error occurred while fetching location: $e");
//     }
//   }
// }

import 'package:geolocator/geolocator.dart';
// ignore: unused_import
import 'package:weather_app/service/api.dart';

class st {
  static double? latt;
  static double? long;

  static getcurrentloaction() async {
    Position p = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: true,
    );
    long = p.longitude;

    latt = p.latitude;

    // ignore: unused_local_variable

    // ignore: unnecessary_null_comparison
    if (p != null) {
      print("latitude ${p.latitude} ");
    } else {
      print("data is unavailable");
    }
  }
}
