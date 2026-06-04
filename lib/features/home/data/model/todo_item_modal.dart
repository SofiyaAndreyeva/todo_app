import 'package:todo_app/features/home/domain/domain.dart';

class TodoItemModal extends TodoItem {
  TodoItemModal({
    super.id,
    required super.listId,
    required  super.description,
    super.isCompleted,
  });

  factory TodoItemModal.fromMap(Map<String, dynamic> map) {
    return TodoItemModal(
      id: map['id'],
      listId: map['list_id'],
      description: map['text'],
      isCompleted: map['is_done'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'list_id': listId,
      'text': description,
      'is_done': isCompleted ? 1 : 0,
    };
  }
}