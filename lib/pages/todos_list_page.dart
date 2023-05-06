import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

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
    return Consumer<TodoListProvider>(
      builder: ((context, todosListProvider, child) => SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('My Todo\'s'),
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
                                    onPressed: (context) => print("Deleted"),
                                  ),
                                  SlidableAction(
                                    backgroundColor: Colors.blueGrey,
                                    icon: Icons.update_sharp,
                                    onPressed: (context) => print("Deleted"),
                                  ),
                                  SlidableAction(
                                    backgroundColor: Colors.green,
                                    icon: Icons.done_all,
                                    onPressed: (context) => print("Deleted"),
                                  ),
                                ],
                              ),
                              child: Card(
                                elevation: 2,
                                color: Colors.cyan,
                                child: ListTile(
                                  leading: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.today_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  title: Text(
                                    todosListProvider.todoList[index].title,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    todosListProvider
                                        .todoList[index].description,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      todosListProvider.todoList[index].id
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
