import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import 'home_widget.dart';


class HomeContent extends StatefulWidget {
  const HomeContent({super.key, required this.theme});

  final ThemeData theme;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final Map<int, bool> opend = {};

  @override
  initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadListsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ListLoaded) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.lists.length,
              itemBuilder: (context, index) {
                return ListMenuWidget(
                  theme: widget.theme,
                  list: state.lists[index],
                  task: state.tasks
                      .where((task) => task.listId == state.lists[index].id)
                      .toList(),
                  isOpen: opend[state.lists[index].id] ?? false,
                  onTap: () {
                    setState(() {
                      opend[state.lists[index].id!] =
                          !(opend[state.lists[index].id!] ?? false);
                    });
                  },
                );
              },
            );
          }

          return ListsEmptyState(theme: widget.theme);
        },
      ),
    );
  }
}
