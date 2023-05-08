import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/todo.dart';

import '../providers/todo_list_provider.dart';

class TitleDesc {
  // final String? titleTodo;
  // final String? descTodo;

  // TitleDesc(this.titleTodo, this.descTodo);

  static Widget?  titleWidget(String titleTodo,) {
    return Consumer<TodoListProvider>(
                builder: (context, listProvider, child) => Text(titleTodo, style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),

    );
  }

   static Widget?  descWidget(String descTodo) {
    return Consumer<TodoListProvider>(
                builder: (context, listProvider, child) => Text(descTodo, style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),

    );
  }
}
