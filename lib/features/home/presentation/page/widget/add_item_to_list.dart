import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../bloc/bloc.dart';
import 'home_widget.dart';

class AddItemToList extends StatefulWidget {
  const AddItemToList({
    super.key,
    required this.isOpen,
    required this.list,
    required this.task,
    required this.theme,
  });

  final bool isOpen;
  final ThemeData theme;
  final TodoList list;
  final List<TodoItem> task;

  @override
  State<AddItemToList> createState() => _AddItemToListState();
}

class _AddItemToListState extends State<AddItemToList> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: widget.isOpen
          ? Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.theme.colorScheme.onSurface.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
                color: widget.theme.colorScheme.surface,
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppTextField(
                          width: 300,
                          onChanged: (value) {
                            setState(() {});
                          },
                          theme: widget.theme,
                          controller: controller,
                          hintText: 'Add a new task...',
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              context.read<HomeBloc>().add(
                                AddTaskEvent(
                                  listId: widget.list.id!,
                                  description: controller.text,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: controller.text.isNotEmpty
                                  ? widget.theme.colorScheme.primary
                                  : widget.theme.colorScheme.primary
                                        .withOpacity(0.5),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: widget.theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Divider(
                      color: widget.theme.colorScheme.onSecondary.withOpacity(
                        0.3,
                      ),
                    ),

                    widget.task.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No tasks yet',
                              style: widget.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                    color: widget.theme.colorScheme.onSecondary,
                                  ),
                            ),
                          )
                        : Column(
                            children: widget.task.map((task) {
                              return ListItem(task: task, theme: widget.theme);
                            }).toList(),
                          ),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
