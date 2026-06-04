import '../entities/entities.dart';

abstract class TodoRepository {
  Future<void> createList(TodoList list);
  Future<List<TodoList>> getLists();
  Future<void> createTask(TodoItem task);
  Future<List<TodoItem>> getTasks(int listId);
  Future<bool> toggleTask(TodoItem task);
  Future<void> deleteTask(int taskId);
  Future<void> deleteList(int listId);
}