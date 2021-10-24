import 'dart:convert';
import 'package:harry_potter_api_app/models/response.dart';
import 'package:http/http.dart' as http;

import 'package:harry_potter_api_app/models/character_api.dart';
import 'constans.dart';

class ApiHelper {
  static Future<Response> getVehicleTypes() async {
    var url = Uri.parse(Constans.apiUrl);
    var response = await http.get(url);

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    List<Character> list = [];    
    var decodedJson = jsonDecode(body);
    if (decodedJson != null) {
      for (var item in decodedJson) {
        list.add(Character.fromJson(item));
      }
    }

    return Response(isSuccess: true, result: list);
  }
}