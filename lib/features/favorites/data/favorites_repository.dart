import 'package:sqflite/sqflite.dart';
import '../../products/model/products.dart';
import 'favorites_db.dart';

class FavoritesRepository {
  FavoritesRepository();

  Future<List<Product>> getAll() async {
    final db = await FavoritesDb.instance.database;
    final rows = await db.query(FavoritesDb.table, orderBy: "title ASC");
    return rows.map(Product.fromMap).toList();
  }

  Future<bool> exists(String id) async {
    final db = await FavoritesDb.instance.database;
    final rows = await db.query(
      FavoritesDb.table,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  Future<void> add(Product product) async {
    final db = await FavoritesDb.instance.database;
    await db.insert(
      FavoritesDb.table,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> remove(String id) async {
    final db = await FavoritesDb.instance.database;
    await db.delete(
      FavoritesDb.table,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> toggle(Product product) async {
    final isFav = await exists(product.id);
    if (isFav) {
      await remove(product.id);
    } else {
      await add(product);
    }
  }
}