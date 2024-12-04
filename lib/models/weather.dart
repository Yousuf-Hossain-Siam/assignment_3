class Weather {
  final String description;
  final double temperature;
  final String icon;

  Weather({required this.description, required this.temperature, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}
