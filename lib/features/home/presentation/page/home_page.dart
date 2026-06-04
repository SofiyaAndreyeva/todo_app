import 'package:flutter/material.dart';
import 'widget/home_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(theme: theme),
          HomeContent(theme: theme),
        ],
      ),
    );
  }
}
