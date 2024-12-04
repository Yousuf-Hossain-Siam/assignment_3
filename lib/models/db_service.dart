import 'package:assignment_3/models/weather.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBService {
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'weather.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE weather(id INTEGER PRIMARY KEY, description TEXT, temperature REAL, icon TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertWeather(Weather weather) async {
    final db = await getDatabase();
    await db.insert(
      'weather',
      {'description': weather.description, 'temperature': weather.temperature, 'icon': weather.icon},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Weather?> getWeather() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('weather');
    if (maps.isNotEmpty) {
      return Weather(
        description: maps.first['description'],
        temperature: maps.first['temperature'],
        icon: maps.first['icon'],
      );
    }
    return null;
  }
}
