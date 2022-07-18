// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constants/images.dart';
import '../data/todos.dart';
import '../models/todo.dart';
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
  void addToTodos() {
    TodoItem newTask = TodoItem(
      id: Todos.todos.length,
      title: _titleFieldController.text,
      description: _descriptionFieldController.text,
      isCompleted: false,
    );

    Todos.todos.add(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Data Entry Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TodoListPage.routeName);
            },
            icon: const Icon(Icons.check_circle),
            iconSize: 25,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Life should not be reduced to a to do list',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Pacifico',
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(Images.dataimage, width: 150),
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
                addToTodos();
                _descriptionFieldController.clear();
                _titleFieldController.clear();
              },
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
