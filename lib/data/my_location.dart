import 'package:geolocator/geolocator.dart';

/*
 geolocator 패키지를 이용해서 위도와 경도를 넘겨주는 코드이다.
 위치 퍼미션도 여기서 받았다.
 */

class Mylocation{
  late double latitude2;
  late double longitude2;

 Future<void> getMyCurrentLocation() async{
   LocationPermission permission;
   //권한 확인 해주기
   permission = await Geolocator.checkPermission();
   //권한 체크
   if (permission == LocationPermission.denied) {
     //권한 요구
     permission = await Geolocator.requestPermission();
     // 권한 재체크
     if (permission == LocationPermission.denied) {
       // Permissions are denied, next time you could try
       // requesting permissions again (this is also where
       // Android's shouldShowRequestPermissionRationale
       // returned true. According to Android guidelines
       // your App should show an explanatory UI now.
       // 권한 없을경우 에러 반환
       return Future.error('Location permissions are denied');
     }
   }
    try{
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    }catch(e){
      print("There was a problem with the internet connection");
    }
  }
}