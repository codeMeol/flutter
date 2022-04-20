import 'package:newsapp/data/network.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/my_location.dart';
import 'package:newsapp/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '459370d17acc83d72365f85824d1a483';

/*
화면 로딩창
 */
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Mylocation mylocation = Mylocation();
    await mylocation.getMyCurrentLocation();
    latitude3 = mylocation.latitude2;
    longitude3 = mylocation.longitude2;

    print(latitude3);
    print(longitude3);

    Network network = Network(
        "https://api.openweathermap.org/data/2.5/weather?"
            "lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric",
        'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=$latitude3&lon=$longitude3&appid=$apikey');
    var weatherData = await network.getJsonData();

    var airData = await network.getAirData();
    print(weatherData);
    print(airData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Weather_screen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 80.0,
        ),
      ),
    );
  }
}
