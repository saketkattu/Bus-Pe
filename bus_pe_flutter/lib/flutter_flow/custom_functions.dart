import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

int getPrice(
  String bStop,
  String dStop,
) {
  // Add your function code here!
  int price = 0;
  var route = [
    "K R Puram",
    "Iti",
    "K R Puram Railway Station",
    "Tin Factory",
    "Kasturinagar Cross",
    "B Channasandra",
    "Ramamurthynagar Underpass",
    "Babusabpalya",
    "Kalyananagar (Hrbr Layout 2nd Block)",
    "Hennur Junction/Hrbr Layout 3rd Block",
    "Hennur Cross",
    "Hennur Bande",
    "Hennur",
    "Geddalahalli (Hennur)",
    "Byrthi Cross",
    "Kothanur (Hennur)",
    "K Narayanapura Cross",
    "Shabari Nagar Cross",
    "Ramakrishna Hegde Nagar",
    "Thirumenahalli Cross (Bellary Road)",
    "Ittige Factory",
    "Kogilu",
    "Sapthagiri Layout",
    "Maruthinagar (Bellary Road)",
    "Kogilu Cross",
    "Yelahanka"
  ];

  //return route;

  int bNum = route.indexOf(bStop);
  int dNum = route.indexOf(dStop);
  int diff = dNum - bNum;

  if (diff < 3) {
    price = 5;
  } else if (diff >= 3 && diff < 5) {
    price = 10;
  } else if (diff >= 5 && diff < 6) {
    price = 15;
  } else if (diff >= 6 && diff < 12) {
    price = 20;
  } else if (diff >= 12 && diff < 26) {
    price = 25;
  } else {
    price = 30;
  }

  return price;
}

List<String> getRoute() {
  // Add your function code here!
  var route = [
    "K R Puram",
    "Iti",
    "K R Puram Railway Station",
    "Tin Factory",
    "Kasturinagar Cross",
    "B Channasandra",
    "Ramamurthynagar Underpass",
    "Babusabpalya",
    "Kalyananagar (Hrbr Layout 2nd Block)",
    "Hennur Junction/Hrbr Layout 3rd Block",
    "Hennur Cross",
    "Hennur Bande",
    "Hennur",
    "Geddalahalli (Hennur)",
    "Byrthi Cross",
    "Kothanur (Hennur)",
    "K Narayanapura Cross",
    "Shabari Nagar Cross",
    "Ramakrishna Hegde Nagar",
    "Thirumenahalli Cross (Bellary Road)",
    "Ittige Factory",
    "Kogilu",
    "Sapthagiri Layout",
    "Maruthinagar (Bellary Road)",
    "Kogilu Cross",
    "Yelahanka"
  ];

  return route;
}

String getQR(String paymentId) {
  // Add your function code here!
  //Dummy image need to edit in actual Flutter
  var imgUrl =
      "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data="+"https://xfj4v2.deta.dev/verify/pay_ITLyo28o8bxG34";
  return imgUrl;
}
