import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class FavoritesDb {
  FavoritesDb._();
  static final FavoritesDb instance = FavoritesDb._();

  static const _dbName = "food_app.db";
  static const _dbVersion = 2;

  static const table = "favorites";

  Database? _db;

  Future<Database> get database async {
    final existing = _db;
    if (existing != null) return existing;

    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _dbName);

    final db = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $table (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            category TEXT NOT NULL,
            priceEgp REAL NOT NULL,
            rating REAL NOT NULL,
            reviewsCount INTEGER NOT NULL,
            imagePath TEXT NOT NULL,
            description TEXT NOT NULL
          )
        ''');
      },
    );

    _db = db;
    return db;
  }
}