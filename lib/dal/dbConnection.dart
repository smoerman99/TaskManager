import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taskmanager/dal/models/task.dart';
import 'package:taskmanager/pages/createTask.dart';

/// This is the source code
/// https://github.com/JohannesMilke/sqflite_database_example/blob/master/lib/db/notes_database.dart
/// bye

class DbConnection {
  static final DbConnection connection = DbConnection();

  static Database _myTasksDb;

  DbConnection();

  Future<Database> get database async {
    if (_myTasksDb != null) {
      return _myTasksDb;
    } else {
      _myTasksDb = await _initDB('taskmanagerdb.db', 1);
      return _myTasksDb;
    }
  }

  Future<Database> _initDB(String filePath, int version) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: (_myTaskDb, version) {
      _myTasksDb.execute(
          "create table tasks (id INTEGER primary key autoincrement, category_id, sub_task_id INTEGER,  title text not null, date_time text not null, done INTEGER)");
      _myTasksDb.execute(
          "create table subtasks (id INTEGER primary key autoincrement, title text not null, description text)");
      _myTasksDb.execute(
          "create table categories (id INTEGER primary key autoincrement, title text not null");
    });
  }

  Future<void> createTask(Task myTask) async {
    final db = await connection.database;

    final id = await db.insert(myTask.toString(), myTask.toJson());
  }

  Future<List<Task>> readAllTasks() async {
    final db = await connection.database;

    final result = await db.query("tasks");

    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future close() async {
    final db = await connection.database;

    db.close();
  }
}
