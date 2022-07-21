// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/todos_count_button.dart';
import '../constants/images.dart';

import '../models/todo.dart';
import '../providers/todo_list_provider.dart';
import 'todos_list_page.dart';

class DataInputScreen extends StatefulWidget {
  const DataInputScreen({Key? key}) : super(key: key);
  static const String routeName = 'Data-Entry-Page';

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final TextEditingController _titleFieldController = TextEditingController();

  final TextEditingController _descriptionFieldController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleFieldController.dispose();
    _descriptionFieldController.dispose();
  }

  // method to add todoItem in todo list
  // void addToTodos() {
  //   TodoItem newTask = TodoItem(
  //     id: Todos.todos.length,
  //     title: _titleFieldController.text,
  //     description: _descriptionFieldController.text,
  //     isCompleted: false,
  //   );

  //   Todos.todos.add(newTask);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Add Your Todo\'s'),
        actions: const [
         TodosCountButton(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Images.dataimage, width: 200),
          ),
          SizedBox(
            width: 330,
            child: TextField(
              controller: _titleFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 330,
            child: TextField(
              controller: _descriptionFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Description'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                TodoItem newTask = TodoItem(
                  id: Provider.of<TodoListProvider>(context, listen: false)
                      .todoList
                      .length,
                  title: _titleFieldController.text,
                  isCompleted: false,
                  description: _descriptionFieldController.text,
                );
                Provider.of<TodoListProvider>(context, listen: false)
                    .addTodo(newTask: newTask);

                _descriptionFieldController.clear();
                _titleFieldController.clear();



                showDialog(context: context, builder:(context) {
                return const AlertDialog(
                   title: Text("Todo"),
                   content: Text("Added successfully"),
                );
               });
              },
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
