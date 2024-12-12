import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TodoListProvider extends ChangeNotifier {
  final List<Map<dynamic, dynamic>> _getTodoList = [];
  int get todoCount => _getTodoList.length;
  Future<void> loadTodo() async {
    try {
      var box = await Hive.openBox('ToDoBox');
      var todoList = box.get('myTodoList');
      // todoList.forEach((todo) => _getTodoList.add(todo));
      if (todoList != null) {
        // Clear any existing data in the list
        _getTodoList.addAll(todoList
            .cast<Map<dynamic, dynamic>>()); // Add loaded data to the list
      }
    } catch (e) {
      print("Error: is here $e");
    }
    notifyListeners();
  }

  void addTodo(String title, String desc, bool isDone, String time) async {
    _getTodoList
        .add({'title': title, 'desc': desc, 'isDone': isDone, 'time': time});
    var box = await Hive.openBox('ToDoBox');
    await box.put('myTodoList', _getTodoList);
    notifyListeners();
  }

  void isTaskCompleted(int index, bool? isDone) {
    _getTodoList[index]['isDone'] = isDone;
    notifyListeners();
  }

  void removeTodo(int index) async {
    _getTodoList.removeAt(index);
    var box = await Hive.openBox('ToDoBox');
    await box.put('myTodoList', _getTodoList);

    notifyListeners();
  }

  List<Map<dynamic, dynamic>> get getTodoList => _getTodoList;
}
