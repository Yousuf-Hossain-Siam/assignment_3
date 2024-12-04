import 'dart:convert';
import 'package:assignment_3/models/weather.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String apiKey = "YOUR_API_KEY";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
