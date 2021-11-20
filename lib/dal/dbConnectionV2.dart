import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///
/// https://medium.com/flutter-community/using-sqlite-in-flutter-187c1a82e8b
///

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, "taskmanagerdb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          "create table tasks (id INTEGER primary key autoincrement, category_id, sub_task_id INTEGER,  title text not null, date_time text not null, done INTEGER)");
      await db.execute(
          "create table subtasks (id INTEGER primary key autoincrement, title text not null, description text)");
      await db.execute(
          "create table categories (id INTEGER primary key autoincrement, title text not null");
    });
  }

  // initDB() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, "TestDB.db");
  //   return await openDatabase(path, version: 1, onOpen: (db) {},
  //       onCreate: (Database db, int version) async {
  //     await db.execute("CREATE TABLE Client ("
  //         "id INTEGER PRIMARY KEY,"
  //         "first_name TEXT,"
  //         "last_name TEXT,"
  //         "blocked BIT"
  //         ")");
  //   });
  // }
}
