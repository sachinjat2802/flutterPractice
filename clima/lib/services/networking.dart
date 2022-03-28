import 'dart:convert';

import 'package:http/http.dart';

class NetWorkHelper {
  NetWorkHelper(this.url);
  Response? response;
  var url;
  Future getData() async {
    try {
      response = await get(url);
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
