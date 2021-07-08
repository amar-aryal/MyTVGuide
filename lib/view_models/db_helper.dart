import 'package:path/path.dart';

import 'package:MyTVGuide/models/series.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  DatabaseHelper.internal();

  Future get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'favouriteShows.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Favourites(id INTEGER PRIMARY KEY, name TEXT, genres TEXT, rating TEXT, imageUrl TEXT)');
  }

  Future getAllFavs() async {
    var db = await initDb();
    var result = await db.rawQuery('SELECT * FROM Favourites');

    return result.toList();
  }

  Future saveFav(ShowClass show) async {
    var db = await initDb();

    var result = await db.rawInsert(
        'INSERT INTO Favourites (id, name, genres, rating, imageUrl) VALUES (\'${show.id}\', \'${show.name}\', \'${show.genres}\', \'${show.rating}\', \'${show.image}\')');

    return result;
  }

  Future deleteFav(int id) async {
    var db = await initDb();

    return await db.rawDelete('DELETE FROM Favourites WHERE id = $id');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
