import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:one/model/weather.dart';

class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    //845c4041d6724bdba5a35827230201

    final queryParameters = {
      "key": "845c4041d6724bdba5a35827230201",
      "q": place,
    };
    try {
      final uri =
          Uri.http("api.weatherapi.com", "/v1/current.json", queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("can not get weather ");
      }
    } catch (e) {
      rethrow;
    }
  }
}
