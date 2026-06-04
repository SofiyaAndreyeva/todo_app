import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/database/migration/migration_v1.dart';

class AppDb {
  AppDb._();

  static final AppDb instance = AppDb._();

  Database? _database;

  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await _init();

    return _database!;
  }

  Future<Database> _init() async {

    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'todo_app.db');

    return await openDatabase(
      path,
      version: 1,

      onCreate: (db, version) async {
        await migrationV1(db);
      },

    );
  }
}