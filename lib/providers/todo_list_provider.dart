// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todolist/components/update_Todo_Dialog.dart';

import '../models/todo.dart';
import '../models/updateTodo.dart';

class TodoListProvider with ChangeNotifier {
  final List<TodoItem> _todos = [];
  final List<TodoItemUpdate> _updateTodos = [];
  bool? check;
  
  void addTodo({
    required TodoItem newTask,
  }) {
    _todos.add(newTask);

    notifyListeners();
  }

  // checkTrue({required check}) {
  //   check = check;
  // }

  void updateTodo({
    required TodoItemUpdate updateTask,
  }) {
    _updateTodos.add(updateTask);

    notifyListeners();
  }

  List<TodoItem> get todoList {
    return _todos;
  }

  List<TodoItemUpdate> get updateTodoList {
    return _updateTodos;
  }
}
