// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constants/images.dart';
import '../data/todos.dart';
import '../models/todo.dart';
import 'todos_list_page.dart';

class DataInputScreen extends StatefulWidget {
  const DataInputScreen({Key? key}) : super(key: key);

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
      isCompleted: false,
    );

    Todos.todos.add(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data Entry Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  const TodoListPage()),
  );
            },
            icon: const Icon(Icons.check_box),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Images.dataimage),
          ),
          SizedBox(
            width: 350,
            child: TextField(
              controller: _titleFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 350,
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
