import '../../domain/domain.dart';
import '../data.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource localDatasource;
  TodoRepositoryImpl({required this.localDatasource});
  @override
  Future<void> createList(TodoList list) async {
    final modal = TodoListModal(id: list.id, title: list.title);
    await localDatasource.createList(modal);
  }

  @override
  Future<List<TodoList>> getLists() async {
    final models = await localDatasource.getLists();

    return models.map((e) {
      return TodoList(id: e.id, title: e.title);
    }).toList();
  }

  @override
  Future<void> createTask(TodoItem task) async {
    final modal = TodoItemModal(
      id: task.id,
      listId: task.listId,
      description: task.description,
      isCompleted: task.isCompleted,
    );
    await localDatasource.createTask(modal);
  }

  @override
  Future<List<TodoItem>> getTasks(int listId) async {
    final tasks = await localDatasource.getTasks(listId);
    return tasks.map((e) {
      return TodoItem(
        id: e.id,
        listId: e.listId,
        description: e.description,
        isCompleted: e.isCompleted,
      );
    }).toList();
  }

  @override
  Future<void> deleteList(int listId) async {
    await localDatasource.deleteList(listId);
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await localDatasource.deleteTask(taskId);
  }

  @override
  Future<bool> toggleTask(TodoItem task) async {
    final modal = TodoItemModal(
      id: task.id,
      listId: task.listId,
      description: task.description,
      isCompleted: task.isCompleted,
    );
    return await localDatasource.toggleTask(modal);
  }
}
