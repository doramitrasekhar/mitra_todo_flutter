import 'package:flutter/material.dart';
import 'package:mitra_tasks/model/Todo.dart';
import 'package:mitra_tasks/services/todo_services.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/widget/ListCellWidget.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  static const String id = 'HomeView';

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.white)),
      home: MyTodoPage(title: APP_NAME),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTodoPage extends StatefulWidget {
  MyTodoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyTodoPageState createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  late TodoServices _todoServices;
  final myController = TextEditingController();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void didChangeDependencies() {
    _todoServices = Provider.of<TodoServices>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          getAddTastWidget(),
          Expanded(
            child: getListView(),
          ),
        ]),
      ),
    );
  }

  Widget getListView() {
    return ReorderableListView.builder(
      itemCount: _todoServices.todoList.length,
      itemBuilder: (context, index) {
        final item = _todoServices.todoList[index];
        return Dismissible(
            background: Container(
              alignment: AlignmentDirectional.centerStart,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            secondaryBackground: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd && !item.completed) {
                _todoServices.updateItem(item.key);
                return false;
              } else if (direction == DismissDirection.endToStart) {
                _todoServices.deleteItem(item.key);
                return true;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Can't uncheck the task"),
                ));
                return false;
              }
            },
            key: Key(_todoServices.todoList[index].title),
            child: ListCellWidget(
                item, kListCellHeight,
                getColor(index)));
      },
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final Todo item = _todoServices.todoList.removeAt(oldIndex);
        _todoServices.todoList.insert(newIndex, item);
      },
    );
  }

  Color getColor(int index) {
    if (index < colorShades.length) {
      return colorShades[index];
    } else {
      return colorShades[colorShades.length - 1];
    }
  }

  Widget getAddTastWidget() {

    final myController = TextEditingController();

    var style = TextStyle(
        color: Colors.white,
        fontSize: kTextFontSize,
        fontWeight: FontWeight.bold);

    return Padding(
      padding: EdgeInsets.zero,
      child: TextField(
        controller: myController,
        textInputAction: TextInputAction.done,
        style: style,
        onSubmitted: (value) {
          if (myController.text.length > 0) {
            _todoServices.addItem(new Todo(title: myController.text, completed: false, key: 0));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please Enter a Task Title"),
            ));
          }
        },
        cursorHeight: kCursorHeight,
        cursorWidth: kCursorWidth,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: kInputTextHint,
          hintStyle: style,
          fillColor: Colors.red.shade800,
          filled: true,
        ),
      ),
    );
  }
}
