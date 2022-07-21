import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/todo_list_provider.dart';

class TodoListPage extends StatefulWidget {
  static const String routeName = 'todos-list-page';
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
    bool _initialValue =false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Todo\'s'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<TodoListProvider>(
              builder: ((context, todosListProvider, child) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: todosListProvider.todoList.length,
                          itemBuilder: (context, index) {
                          
                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:  CheckboxListTile(
                      tileColor:Colors.white ,
                       title: Text(todosListProvider.todoList[index].title),
                      secondary: const Icon(Icons.today_outlined,size: 30,),
                      subtitle: Text(todosListProvider.todoList[index].description),
                    
                      selected: _initialValue,
                      value: _initialValue,
                      onChanged: (value) {
                        setState(() {
                          _initialValue=value!;
                        });
                      },
                    ) 
                            );
                          }),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
