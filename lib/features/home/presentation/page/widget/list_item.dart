import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../bloc/bloc.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.task, required this.theme});

  final TodoItem task;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            context.read<HomeBloc>().add(ToggleTaskEvent(task: task));
          },
          activeColor: theme.colorScheme.primary,

          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),

        Text(
          task.description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: task.isCompleted
                ? theme.colorScheme.onSurface.withOpacity(0.5)
                : theme.colorScheme.onSurface,
            fontSize: 14,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.read<HomeBloc>().add(DeleteTaskEvent(taskId: task.id!));
          },
          child: Icon(
            Icons.delete_outline,
            size: 20,
            color: theme.colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
