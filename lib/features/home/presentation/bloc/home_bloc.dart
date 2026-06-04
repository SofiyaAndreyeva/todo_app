import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/presentation/bloc/home_event.dart';
import 'package:todo_app/features/home/presentation/bloc/home_state.dart';
import '../../domain/domain.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoUseCase todoUseCase;
  HomeBloc(this.todoUseCase) : super(HomeInitial()) {
    on<CreateListEvent>(_onCreateList);
    on<LoadListsEvent>(_onLoadLists);
    on<AddTaskEvent>(_onCreateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<DeleteListEvent>(_onDeleteList);
    on<ToggleTaskEvent>(_onToggleTask);
  }
  Future<void> _onCreateList(
    CreateListEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(ListCreating());
    try {
      await todoUseCase.createList(event.title);
    
      emit(ListCreated());
    } catch (e) {
      emit(HomeInitial());
    }
  }

  Future<void> _onLoadLists(
    LoadListsEvent event,
    Emitter<HomeState> emit,
  ) async {
    print('LOAD LISTS');

    emit(ListLoading());

    try {
      final lists = await todoUseCase.getLists();
      print('lists count = ${lists.length}');
      await _reloadData(emit);
    } catch (e) {
      print(e);
      emit(HomeInitial());
    }
  }

  Future<void> _onCreateTask(
    AddTaskEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await todoUseCase.createTask(event.listId, event.description);
      print('Task created: ${event.description} in list ${event.listId}');
      await _reloadData(emit);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onDeleteTask(
    DeleteTaskEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await todoUseCase.deleteTask(event.taskId);
      print('Task deleted: ${event.taskId}');
      await _reloadData(emit);
    } catch (e) {
      // emit(HomeInitial());
      print(e);
    }
  }

  Future<void> _onDeleteList(
    DeleteListEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await todoUseCase.deleteList(event.listId);
      print('List deleted: ${event.listId}');
      await _reloadData(emit);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _reloadData(Emitter<HomeState> emit) async {
    final lists = await todoUseCase.getLists();

    List<TodoItem> allTasks = [];

    for (final list in lists) {
      print('Loading tasks for list: ${list.id} - ${list.title}');
      allTasks.addAll(await todoUseCase.getTasks(list.id!));
    }

    emit(ListLoaded(lists: lists, tasks: allTasks));
  }
  Future<void> _onToggleTask(
    ToggleTaskEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await todoUseCase.toggleTask(event.task);
      print('Task toggled: ${event.task.id} in list ${event.task.listId}');
      await _reloadData(emit);
    } catch (e) {
      print(e);
    }
  }
}
