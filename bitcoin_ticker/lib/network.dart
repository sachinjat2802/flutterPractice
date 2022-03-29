import 'package:http/http.dart';
import 'dart:convert';

class NetWorkHelper {
  NetWorkHelper(this.url);
  Response? response;
  Map<String, String> header = {
    'X-CoinAPI-Key': '93006FA5-8CCC-4DB9-AC28-04D10C05825B'
  };
  var url;
  Future getData() async {
    try {
      response = await get(url, headers: header);
      if (response!.statusCode == 200) {
        return jsonDecode(response!.body);
      } else {
        print(response!.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
