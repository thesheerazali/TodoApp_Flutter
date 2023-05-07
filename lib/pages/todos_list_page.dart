import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../components/todos_ListTile_widget.dart';
import '../components/updateTodoDialog.dart';
import '../providers/todo_list_provider.dart';

class TodoListPage extends StatefulWidget {
  static const String routeName = 'todos-list-page';
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool _initialValue = false;

  @override
  Widget build(BuildContext context) {
    UpdateTodoList updateTodoList = UpdateTodoList();
    return Consumer<TodoListProvider>(
      builder: ((context, todosListProvider, child) => SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'My Todo\'s',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.cyan,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: todosListProvider.todoList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    onPressed: (context) => setState(() {
                                      todosListProvider.todoList
                                          .removeAt(index);
                                    }),
                                  ),
                                  SlidableAction(
                                    backgroundColor: Colors.blueGrey,
                                    icon: Icons.update_sharp,
                                    onPressed: (context) =>
                                        updateTodoList.updateData(context,index),
                                  ),
                                  SlidableAction(
                                    backgroundColor: Colors.green,
                                    icon: Icons.done_all,
                                    onPressed: (context) => print("Deleted"),
                                  ),
                                ],
                              ),
                              child: TodoListTile.listTileTodo(context, index),
                            
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
