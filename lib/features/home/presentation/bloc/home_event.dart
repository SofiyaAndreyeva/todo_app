import '../../domain/domain.dart';

abstract class HomeEvent {}
class CreateListEvent extends HomeEvent {
  final String title;
  CreateListEvent({required this.title});
}
class LoadListsEvent extends HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final int listId;
  final String description;
  AddTaskEvent({required this.listId, required this.description});
}
class GetTasksEvent extends HomeEvent {
  final int listId;
  GetTasksEvent({required this.listId});
}

class DeleteListEvent extends HomeEvent {
  final int listId;
  DeleteListEvent({required this.listId});
}

class DeleteTaskEvent extends HomeEvent {
  final int taskId;
  DeleteTaskEvent({required this.taskId});
}
class ToggleTaskEvent extends HomeEvent {
  final TodoItem task;
  ToggleTaskEvent({required this.task});
}