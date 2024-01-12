import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    var theDatabase = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDatabase;
  }

  void _onCreate(Database db, int version) async {
    // Create tables and define the schema
    await db.execute('''
      CREATE TABLE note_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        Title TEXT,
        desc TEXT,
        date TEXT,
        color INTEGER
        
      )
    ''');
  }

  Future<int> insertData(Map<String, dynamic> row) async {
    Database? dbClient = await db;
    return await dbClient!.insert('note_table', row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? dbClient = await db;
    return await dbClient!.query('note_table');
  }

  Future<int> updateData(Map<String, dynamic> row) async {
    Database? dbClient = await db;
    int id = row['id'];
    return await dbClient!
        .update('note_table', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteData(int id) async {
    Database? dbClient = await db;
    return await dbClient!
        .delete('note_table', where: 'id = ?', whereArgs: [id]);
  }
}
