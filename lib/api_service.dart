import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_clock/json_to_dart.dart';
class Data{
  Future<Time> fetchDateTime({continent,country}) async {
    final response = await http
        .get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=$continent/$country'));

    if (response.statusCode == 200) {
      return Time.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to load');
    }
  }
}