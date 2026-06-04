import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class ListDialog extends StatefulWidget {
  const ListDialog(this.theme, {super.key});

  final ThemeData theme;

  @override
  State<ListDialog> createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog> {
  final controller = TextEditingController();
  bool blocked = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ListCreated) {
          controller.clear();
          Navigator.pop(context);
          context.read<HomeBloc>().add(LoadListsEvent());
        }
        if (state is ListCreating) {
          setState(() {
            blocked = true;
          });
        }
      },
      child: Dialog(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create new list',
                    style: widget.theme.textTheme.headlineMedium,
                  ),

                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: widget.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Enter the name of your new task list.',
                style: widget.theme.textTheme.bodyMedium?.copyWith(
                  color: widget.theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 20),
              AppTextField(
                theme: widget.theme,
                controller: controller,
                hintText: 'Enter list name...',
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (controller.text.isNotEmpty && !blocked) {
                    context.read<HomeBloc>().add(
                      CreateListEvent(title: controller.text),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 40,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: controller.text.isNotEmpty
                        ? widget.theme.colorScheme.primary
                        : widget.theme.colorScheme.primary.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Text(
                      'Create',
                      style: widget.theme.textTheme.bodyMedium?.copyWith(
                        color: widget.theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
