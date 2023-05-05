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
                                child: ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.today_outlined),
                                  title: Text(
                                      todosListProvider.todoList[index].title),
                                  subtitle: Text(todosListProvider
                                      .todoList[index].description),
                                ),
                              );
                              // Card(
                              //   elevation: 2,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   child: GestureDetector(
                              //     onHorizontalDragStart: (details) =>
                              //         print('yeess'),
                              //     child: SizedBox(
                              //       child: CheckboxListTile(
                              //         tileColor: Colors.white,
                              //         title: Text(
                              //             todosListProvider.todoList[index].title),
                              //         secondary: const Icon(
                              //           Icons.today_outlined,
                              //           size: 30,
                              //         ),
                              //         subtitle: Text(todosListProvider
                              //             .todoList[index].description),
                              //         selected: _initialValue,
                              //         value: _initialValue,
                              //         onChanged: (value) {
                              //           setState(
                              //             () {
                              //               _initialValue = value!;
                              //             },
                              //           );
                              //         },
                              //       ),
                              //     ),
                              //   ),
                              // );
                            }),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
