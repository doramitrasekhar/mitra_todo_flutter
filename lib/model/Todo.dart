import 'package:hive/hive.dart';

part 'Todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  bool completed;

  @HiveField(1)
  String title;

  @HiveField(2)
  int key;

  Todo({required this.title, required this.completed, required this.key});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        completed = json['completed'],
        key = json['key'];

  Map<String, dynamic> toJson() =>
      {'title': title, 'completed': completed, 'key': key};
}
