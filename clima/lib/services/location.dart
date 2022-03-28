import 'package:geolocator/geolocator.dart';
import 'networking.dart';

class Location {
  double? latitude;
  double? longitude;
  Future getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;

      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=0eaa503647a8fa8b7de73b204544ae61&units=metric");
      NetWorkHelper netWorkHelper = NetWorkHelper(url);
      var data = await netWorkHelper.getData();
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future cityLocation(cityNAme) async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityNAme&appid=0eaa503647a8fa8b7de73b204544ae61&units=metric');
      NetWorkHelper netWorkHelper = NetWorkHelper(url);
      var data = await netWorkHelper.getData();
      return data;
    } catch (e) {
      print(e);
    }
  }
}
