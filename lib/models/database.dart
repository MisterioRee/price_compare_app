import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:price_compare/models/product.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database? _database;

  get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Product ("
          "id TEXT PRIMARY KEY,"
          "title TEXT,"
          "price TEXT,"
          "description TEXT,"
          "image TEXT"
          ")");
    });
  }

  addProduct(Product product) async {
    final db = await database;

    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Product (id,title,price,description,image)"
        " VALUES (?,?,?,?,?)",
        [
          product.id,
          product.title,
          product.price,
          product.description,
          product.image
        ]);
    return raw;
  }

  Future<List<dynamic>> getAllProduct() async {
    final db = await database;
    var res = await db.query("Product");
    List<dynamic> list =
        res.isNotEmpty ? res.map((c) => Product.fromJson(c)).toList() : [];
    return list;
  }

  deleteProduct(String id) async {
    final db = await database;
    return db.delete("Product", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Product");
  }
}
