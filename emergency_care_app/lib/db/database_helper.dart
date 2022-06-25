import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblWatchlist = 'kontak';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/emergency.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        nama TEXT PRIMARY KEY,
        phone TEXT
      );
    ''');
  }

  Future<int> insertKontak(dynamic kontak) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, kontak.toJson());
  }

  Future<int> removeKontak(dynamic kontak) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'nama = ?',
      whereArgs: [kontak.nama],
    );
  }

  Future<List<Map<String, dynamic>>> getKontak() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

    return results;
  }
}
