import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/home.dart';
import '../core.dart';

class AppBloc {
  static final List<BlocProvider> appBlocs = [
      BlocProvider<HomeBloc>(
      create: (_) => getIt<HomeBloc>(),
    ),
  ];
}
