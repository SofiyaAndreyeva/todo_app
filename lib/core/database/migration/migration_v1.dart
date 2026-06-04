import 'package:sqflite/sqlite_api.dart';

Future<void> migrationV1(Database db) async {
    await db.execute('''
    CREATE TABLE todo_lists (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL
    )
  ''');

  await db.execute('''
    CREATE TABLE todo_tasks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      list_id INTEGER NOT NULL,
      text TEXT NOT NULL,
      is_done INTEGER NOT NULL,
      FOREIGN KEY (list_id)
      REFERENCES todo_lists(id)
    )
  ''');

}