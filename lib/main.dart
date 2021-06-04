import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mitra_tasks/model/Todo.dart';
import 'package:mitra_tasks/routes.dart';
import 'package:mitra_tasks/services/todo_services.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(TodoAdapter());
  final Box<Todo> db = await Hive.openBox(DB_NAME);
  runApp(MyApp(database: db));
}

class MyApp extends StatelessWidget {
  final Box<Todo> database;

  MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoServices(database))
      ],
      child: Routes(),
    );
  }
}
