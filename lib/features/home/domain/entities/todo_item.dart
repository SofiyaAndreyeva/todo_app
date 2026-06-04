class TodoItem {
  final int? id;
  final int listId;
  final String description;
  bool isCompleted;

  TodoItem({
    this.id,
    required this.listId,
    required this.description,
    this.isCompleted = false,
  });
}
