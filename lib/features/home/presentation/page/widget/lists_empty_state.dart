import 'package:flutter/material.dart';

class ListsEmptyState extends StatelessWidget {
  const ListsEmptyState({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(
          Icons.folder_outlined,
          size: 70,
          color: theme.colorScheme.onSecondary,
        ),
        Text(
          "No lists yet",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          "Create list to get started!",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
