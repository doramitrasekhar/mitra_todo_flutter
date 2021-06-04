import 'package:flutter/material.dart';
import 'package:mitra_tasks/pageview.dart';
import 'package:mitra_tasks/views/todo_list.dart';

class Routes extends StatefulWidget {
  static const String id = 'Routes';

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  /// initiate page with zero index
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/todolist': (context) => TodoList(),
        '/': (context) => MyPageView(controller: controller),
      },
    );
  }
}
