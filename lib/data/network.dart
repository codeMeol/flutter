import 'package:http/http.dart' as http;//http 쓰는 이유는 다른 개발자가 봤을때 헷갈리지 않게 하기 위해서이다.
import 'dart:convert';
/*
url 접속 되는지 확인 후 json데이터 반환해주는 코드

 */

class Network {
  final String url; //openweather apidoc
  final String url2; //airpollution apidoc

  Network(this.url, this.url2); //생성자

  //비동기식 처리
  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));
    //처리 성공
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else //처리 실패
    {
      //실패 코드 띄우고 리턴값 확인해서 오류 체크
      print(response.statusCode);
      return response.body;
    }
  }

  //위와 같음
  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print(response.statusCode);
      return response.body;
    }
  }
}
