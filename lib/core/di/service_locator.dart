import 'package:get_it/get_it.dart';

import '../../features/home/data/data.dart';
import '../../features/home/domain/domain.dart';
import '../../features/home/home.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {

  /// DATASOURCE
  getIt.registerLazySingleton<TodoLocalDatasource>(
    () => TodoLocalDatasource(),
  );

  /// REPOSITORY
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDatasource: getIt(),
    ),
  );

  /// USECASE
  getIt.registerLazySingleton<TodoUseCase>(
    () => TodoUseCase(
      repository: getIt(),
    ),
  );

  /// BLOCS
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      getIt(),
    ),
  );
}