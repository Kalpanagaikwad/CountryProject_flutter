import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_country/Country.dart';

class ApiServices {
  static const String url = 'https://restcountries.eu/rest/v2/all/';

  static Future<List<Country>> getCountry() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Country> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Country> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}