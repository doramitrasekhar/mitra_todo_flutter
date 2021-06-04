import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mitra_tasks/model/Todo.dart';
import 'package:mitra_tasks/util/constants.dart';

class TodoServices extends ChangeNotifier {
  List<Todo> _todoList = <Todo>[];

  List<Todo> get todoList => _todoList;

  var rng = new Random();

  // Constructor
  TodoServices(Box<Todo> db) {
    getItem();
  }

  /// Add's Item in Hive
  addItem(Todo todoTask) async {
    var box = await Hive.openBox<Todo>(DB_NAME);
    int key = rng.nextInt(1000);
    todoTask.key = key;
    box.put(key, todoTask);
    print('TASK ADDED');
    getItem();
  }

  /// Get's all the Items from Hive
  getItem() async {
    final box = await Hive.openBox<Todo>(DB_NAME);
    List<Todo> todoList = box.values.toList();
    List<Todo> mCompleted = <Todo>[];
    List<Todo> mNotCompleted = <Todo>[];
    for (var i = 0; i < todoList.length; i++) {
      Todo item = todoList[i];
      if (item.completed) {
        mCompleted.add(item);
      } else {
        mNotCompleted.add(item);
      }
    }
    mNotCompleted.addAll(mCompleted);
    _todoList.clear();
    _todoList = mNotCompleted;
    print('FETCH TASKS DONE');
    notifyListeners();
  }

  /// Update's Item from Hive
  updateItem(int key) {
    final box = Hive.box<Todo>(DB_NAME);
    Todo? todoItem = box.get(key);
    if (todoItem != null) {
      if (todoItem.completed) {
        todoItem.completed = false;
      } else {
        todoItem.completed = true;
      }
    }
    if (todoItem != null) {
      box
          .put(key, todoItem)
          .whenComplete(() => {print('UPDATE TASK DONE'), getItem()});
    }
  }

  /// Delete's Item from Hive
  deleteItem(int key) {
    final box = Hive.box<Todo>(DB_NAME);
    box.delete(key);
    print('DELETE TASK DONE');
    getItem();
  }
}
