import 'package:go_router/go_router.dart';
import 'package:todo_app/features/features.dart';

class AppRoute {
  static const String home = '/';
  static final router = GoRouter(
    routes: [GoRoute(path: home, builder: (context, state) => HomePage())],
  );
}
