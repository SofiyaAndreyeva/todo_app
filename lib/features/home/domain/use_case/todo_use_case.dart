import 'package:todo_app/features/home/domain/repository/todo_repository.dart';

import '../entities/entities.dart';

class TodoUseCase {
  final TodoRepository repository;
  TodoUseCase({required this.repository});
  Future<void> createList(String title) async {
    if (title.isEmpty) {
      throw Exception('Title cannot be empty');
    }
    final list = TodoList(title: title);
    await repository.createList(list);
  }

  Future<List<TodoList>> getLists() async {
    return await repository.getLists();
  }

  Future<void> createTask(int listId, String description) async {
    if (description.isEmpty) {
      throw Exception('Description cannot be empty');
    }
    final task = TodoItem(description: description, listId: listId);
    await repository.createTask(task);
  }

  Future<List<TodoItem>> getTasks(int listId) async {
    if (listId <= 0) {
      throw Exception('Invalid list ID');
    }
    return await repository.getTasks(listId);
  }

  Future<bool> toggleTask(TodoItem task) async {
    if (task.id == null) {
      throw Exception('Task ID cannot be null');
    }
    return await repository.toggleTask(task);
  }

  Future<void> deleteTask(int taskId) async {
    if (taskId <= 0) {
      throw Exception('Invalid task ID');
    }
    await repository.deleteTask(taskId);
  }

  Future<void> deleteList(int listId) async {
    if (listId <= 0) {
      throw Exception('Invalid list ID');
    }
    await repository.deleteList(listId);
  }
}
