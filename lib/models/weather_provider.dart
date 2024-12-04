import 'package:assignment_3/api_service.dart';
import 'package:assignment_3/models/db_service.dart';
import 'package:assignment_3/models/weather.dart';
import 'package:flutter/material.dart';


class WeatherProvider with ChangeNotifier {
  Weather? _weather;

  Weather? get weather => _weather;

  Future<void> fetchWeather(String city) async {
    try {
      ApiService apiService = ApiService();
      DBService dbService = DBService();
      _weather = await apiService.fetchWeather(city);

      // Save data to local database
      dbService.insertWeather(_weather!);
      notifyListeners();
    } catch (e) {
      // Try fetching from cache if online fetch fails
      DBService dbService = DBService();
      _weather = await dbService.getWeather();
      notifyListeners();
    }
  }
}
