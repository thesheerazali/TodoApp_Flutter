// import 'package:flutter/material.dart';

// import '../models/todo.dart';

// class AddTodos{

//          static addTodos(){
       
//            if (_formKey.currentState!.validate()) {
//                       TodoItem newTask = TodoItem(
//                         id: listProvider.todoList.length,
//                         title: _titleFieldController.text,
//                         isCompleted: false,
//                         description: _descriptionFieldController.text,
//                       );
//                       listProvider.addTodo(newTask: newTask);

//                       _descriptionFieldController.clear();
//                       _titleFieldController.clear();

//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return const AlertDialog(
//                               title: Text("Todo"),
//                               content: Text("Added successfully"),
//                             );
//                           });
//                     } else {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return const AlertDialog(
//                               title: Text("Todo"),
//                               content:
//                                   Text("You must have to add Todo Name and desc..! "),
//                             );
//                           });
//                     }
//          }


// }