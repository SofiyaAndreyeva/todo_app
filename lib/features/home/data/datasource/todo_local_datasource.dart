import 'package:todo_app/core/core.dart';

import '../model/model.dart';

class TodoLocalDatasource {
  Future<void> createList(TodoListModal list) async {
    final db = await AppDb.instance.database;
    await db.insert('todo_lists', list.toMap());
  }

  Future<List<TodoListModal>> getLists() async {
    final db = await AppDb.instance.database;
    final maps = await db.query('todo_lists');
    return maps.map((map) => TodoListModal.fromMap(map)).toList();
  }

  Future<void> createTask(TodoItemModal task) async {
    final db = await AppDb.instance.database;
    await db.insert('todo_tasks', task.toMap());
  }

  Future<List<TodoItemModal>> getTasks(int listId) async {
    final db = await AppDb.instance.database;
    final maps = await db.query(
      'todo_tasks',
      where: 'list_id = ?',
      whereArgs: [listId],
    );
    return maps.map((map) => TodoItemModal.fromMap(map)).toList();
  }

  Future<bool> toggleTask(TodoItemModal task) async {
    final db = await AppDb.instance.database;

    final result = await db.update(
      'todo_tasks',
      {'is_done': !task.isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [task.id],
    );

    return result > 0;
  }

  Future<void> deleteTask(int taskId) async {
    final db = await AppDb.instance.database;
    await db.delete('todo_tasks', where: 'id = ?', whereArgs: [taskId]);
  }

  Future<void> deleteList(int listId) async {
    final db = await AppDb.instance.database;

    await db.transaction((txn) async {
      await txn.delete('todo_tasks', where: 'list_id = ?', whereArgs: [listId]);

      await txn.delete('todo_lists', where: 'id = ?', whereArgs: [listId]);
    });
  }
}
