import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.theme,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.height = 40,
    this.width = double.infinity,
  });

  final ThemeData theme;
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: false,
        showCursor: false,
        cursorColor: theme.colorScheme.onSurface,
        cursorWidth: 1,

        maxLength: 30,

        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          counterText: '',

          fillColor: theme.colorScheme.onSecondary.withOpacity(0.5),
          filled: true,

          contentPadding: EdgeInsets.all(4),
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.colorScheme.onSurface.withOpacity(0.2),
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.colorScheme.onSurface,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
