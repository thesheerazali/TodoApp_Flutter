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
  final _formKey = GlobalKey<FormState>();

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
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Add Your Todo\'s',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          TodosCountButton(),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(Images.dataimage, width: 200),
            ),
            SizedBox(
              width: 330,
              child: TextFormField(
                controller: _titleFieldController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "userName Can Not be Empty";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 330,
              child: TextFormField(
                controller: _descriptionFieldController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "userName Can Not be Empty";
                  }
                  return null;
                },
              ),
            ),
            Consumer<TodoListProvider>(
              builder: (context, listProvider, child) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      //  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      TodoItem newTask = TodoItem(
                        id: listProvider.todoList.length,
                        title: _titleFieldController.text,
                        isCompleted: false,
                        description: _descriptionFieldController.text,
                      );
                      listProvider.addTodo(newTask: newTask);

                      _descriptionFieldController.clear();
                      _titleFieldController.clear();

                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Todo"),
                              content: Text("Added successfully"),
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Todo"),
                              content: Text(
                                  "You must have to add Todo Name and desc..! "),
                            );
                          });
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
