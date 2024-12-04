import 'package:assignment_3/models/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return Column(
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'Enter City'),
              ),
              ElevatedButton(
                onPressed: () {
                  weatherProvider.fetchWeather(_cityController.text);
                },
                child: Text('Get Weather'),
              ),
              weatherProvider.weather == null
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          'Temperature: ${weatherProvider.weather!.temperature}°C',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('Description: ${weatherProvider.weather!.description}'),
                        Image.network(
                            'http://openweathermap.org/img/wn/${weatherProvider.weather!.icon}.png'),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}
