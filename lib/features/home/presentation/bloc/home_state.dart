import '../../domain/domain.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ListCreating extends HomeState {}

class ListCreated extends HomeState {}

class ListLoading extends HomeState {}

class ListLoaded extends HomeState {
  final List<TodoList> lists;
  final List<TodoItem> tasks;
  ListLoaded({required this.lists, required this.tasks});
}

