import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = 'mydatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'my table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnPrenom = 'prenom';
  static final columnEmail = 'email';
  static final columnPassword = 'password';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  //return _database;
  //}

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(''' 
          CREATE TABLE $_tableName ( 
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
          $columnPrenom TEXT NOT NULL,
          $columnEmail TEXT NOT NULL,
          $columnPassword TEXT NOT NULL, )
                    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
