import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/core.dart';

import 'home_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [theme.colorScheme.tertiary, theme.colorScheme.primary],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 70, right: 24, left: 24, bottom: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.todo,
              width: 30,
              height: 30,
              color: theme.colorScheme.onPrimary,
            ),
            SizedBox(width: 10),
            Text(
              'My Tasks',
              style: theme.textTheme.headlineLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ListDialog(theme);
                  },
                );
              },
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.onPrimary.withOpacity(0.2),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.folder,
                      size: 30,
                      color: theme.colorScheme.onPrimary,
                    ),

                    Icon(Icons.add, size: 15, color: theme.colorScheme.primary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
