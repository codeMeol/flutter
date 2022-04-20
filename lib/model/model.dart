import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Model {
  //날씨 데이터에 따른 아이콘 반환
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    }

    else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    }

    else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );
    }

    else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    }
  }
  //공기질에 따른 아이콘 반환 비동기식이고 null-safety 때문에 widget에 questionmark 넣어줬음
  Widget? getAirIcon(dynamic index) {
    if (index == 1) {
      return Image.asset(
          'image/good.png',
          width: 37.0,
          height: 35.0
      );
    }
    else if (index == 2) {
      return Image.asset(
          'image/fair.png',
          width: 37.0,
          height: 35.0
      );
    }
    if (index == 3) {
      return Image.asset(
          'image/moderate.png',
          width: 37.0,
          height: 35.0
      );
    }
    if (index == 4) {
      return Image.asset(
          'image/poor.png',
          width: 37.0,
          height: 35.0
      );
    }
    if (index == 5) {
      return Image.asset(
          'image/bad.png',
          width: 37.0,
          height: 35.0
      );
    }
  }
  //공기 질에 따른 날씨 데이터값 text위젯으로 반환
  Widget? getAirCondition(dynamic index) {
    if (index == 1) {
      return Text(
        '"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 2) {
      return Text(
        '"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 3) {
      return Text(
        '"보통"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 4) {
      return Text(
        '"나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    else if (index == 5) {
      return Text(
        '"매우 나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}