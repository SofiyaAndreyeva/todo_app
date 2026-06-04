import 'package:todo_app/features/home/domain/domain.dart';

class TodoListModal extends TodoList {
  TodoListModal({
    super.id,
    required  super.title,
  });

  factory TodoListModal.fromMap(Map<String, dynamic> map) {
    return TodoListModal(
      id: map['id'],
      title: map['title'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}