import 'package:newsapp/data/network.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/model/model.dart';
/*
받아온 데이터로 화면을 구성해주는 페이지입니다.

 */

class Weather_screen extends StatefulWidget {
  Weather_screen({this.parseWeatherData, this.parseAirPollution});

  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _Weather_screenState createState() => _Weather_screenState();
}

class _Weather_screenState extends State<Weather_screen> {
  Model model = Model();
  //
  late String cityName; //지역이름
  late int temp; //온도 값 `C
  late int weatherId; //JSON데이터 CONDITION 값
  late Widget icon; //날씨상태에 따른 아이콘
  late String des;
  late Widget airIcon, airState;
  late double dust1, dust2; //미세먼지 초미세먼지
  late int index;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {

    double temp_parsed = weatherData['main']['temp'];
    index = airData["list"][0]["main"]["aqi"];
    cityName = weatherData['name'];
    weatherId = weatherData["weather"][0]["id"];
    temp=temp_parsed.toInt();
    icon = model.getWeatherIcon(weatherId)!;
    des = weatherData["weather"][0]["description"];
    airIcon = model.getAirIcon(index)!;
    airState = model.getAirCondition(index)!;
    dust1 = airData["list"][0]["components"]["pm10"];
    dust2 = airData["list"][0]["components"]["pm2_5"];

    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //앱바 좌측코드 leading
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        //앱바 우측코드 actions
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_searching,
            ),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(children: [
          Image.asset(
            "image/background.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150.0,
                          ),
                          Text(
                            '$cityName',
                            style: GoogleFonts.lato(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              TimerBuilder.periodic(
                                (Duration(minutes: 1)),
                                builder: (context) {
                                  return Text(
                                    '${getSystemTime()}',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white),
                                  );
                                },
                              ),
                              Text(DateFormat(' - EEEE').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white)),
                              Text(DateFormat('dd  MMM, yyyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white))
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$temp\u2103',
                            style: GoogleFonts.lato(
                                fontSize: 85.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          icon,
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "$des",
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Divider(
                      height: 15.0,
                      thickness: 2.0,
                      color: Colors.white30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'AQI(대기질 지수)',
                              style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            airIcon,
                            SizedBox(
                              height: 10.0,
                            ),
                            airState
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '미세먼지',
                              style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "$dust1",
                              style: GoogleFonts.lato(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "μm/m3",
                              style: GoogleFonts.lato(
                                  fontSize: 14.0, color: Colors.black),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '초미세먼지',
                              style: GoogleFonts.lato(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("$dust2",
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("μm/m3",
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.black))
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
