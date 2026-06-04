import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../bloc/bloc.dart';
import 'home_widget.dart';

class ListMenuWidget extends StatelessWidget {
  const ListMenuWidget({
    super.key,
    required this.theme,
    required this.list,
    required this.task,
    required this.isOpen,
    required this.onTap,
  });

  final ThemeData theme;
  final TodoList list;
  final List<TodoItem> task;
  final bool isOpen;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: isOpen
                  ? BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )
                  : BorderRadius.circular(8),
              color: theme.colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSurface.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        child: Icon(
                          isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          color: theme.colorScheme.surface,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list.title,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.surface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            task.isEmpty
                                ? '0 task'
                                : task.length == 1
                                ? '1 task'
                                : '${task.length} tasks',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.read<HomeBloc>().add(
                            DeleteListEvent(listId: list.id!),
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          color: theme.colorScheme.surface,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          AddItemToList(isOpen: isOpen, list: list, task: task, theme: theme),
        ],
      ),
    );
  }
}
