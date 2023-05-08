import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/titke_decs.dart';
import 'package:todolist/components/todos_ListTile_widget.dart';
import 'package:todolist/models/todo.dart';

import '../models/updateTodo.dart';
import '../providers/todo_list_provider.dart';

// class UpdateListTile extends StatefulWidget {
//   const UpdateListTile({Key? key}) : super(key: key);

//   @override
//   State<UpdateListTile> createState() => _UpdateListTileState();
// }

// class _UpdateListTileState extends State<UpdateListTile> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class UpdateTodoList {
  final TextEditingController _titleFieldControllerUpdate =
      TextEditingController();

  final TextEditingController _descriptionFieldControllerUpdate =
      TextEditingController();

  Future updateData(context, index) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Your Todo"),
        actions: [
          TextFormField(
            controller: _titleFieldControllerUpdate,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Title'),
          ),
          TextFormField(
            controller: _descriptionFieldControllerUpdate,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'description'),
          ),
          Consumer<TodoListProvider>(
              builder: (context, listProviderUpdate, child) => Padding(
                    padding: const EdgeInsets.only(
                      right: 100,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          // TitleDesc.titleWidget(
                          //     _titleFieldControllerUpdate.text.);
                          // TitleDesc.descWidget(
                          //     _descriptionFieldControllerUpdate.text);
                          // todoListTile.todoDecs =
                          //     _titleFieldControllerUpdate.text ;
                          // todoListTile.todoDecs =
                          //
                          //
                          //
                          //   _descriptionFieldControllerUpdate.text ;
                          listProviderUpdate.check = false;
                          TodoItemUpdate updateTask = TodoItemUpdate(
                            idUp: listProviderUpdate.todoList.length,
                            titleUp: _titleFieldControllerUpdate.text,
                            isCompletedUp: false,
                            descriptionUp:
                                _descriptionFieldControllerUpdate.text,
                          );
                          listProviderUpdate.updateTodo(
                            updateTask: updateTask,
                          );

                          _descriptionFieldControllerUpdate.clear();
                          _titleFieldControllerUpdate.clear();

                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text("Todo"),
                                  content: Text("Update successfully"),
                                );
                              });
                          // Card(
                          //   elevation: 2,
                          //   color: Colors.cyan,
                          //   child: ListTile(
                          //     leading: const Padding(
                          //       padding: EdgeInsets.all(5.0),
                          //       child: Icon(
                          //         Icons.today_outlined,
                          //         color: Colors.black,
                          //         size: 30,
                          //       ),
                          //     ),

                          //     title: TitleDesc.descWidget(listProviderUpdate
                          //         .updateTodoList[index].titleUp),
                          //     subtitle: TitleDesc.descWidget(listProviderUpdate
                          //         .updateTodoList[index].titleUp),
                          //     trailing: Padding(
                          //       padding: const EdgeInsets.all(16.0),
                          //       child: Text(
                          //         listProviderUpdate.todoList[index].id
                          //             .toString(),
                          //         style: const TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 25,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // );

                          // print("Tabed");

                          //   listProviderUpdate.addTodo(newTask: newTask);

                          //   _descriptionFieldControllerUpdate.clear();
                          //   _titleFieldControllerUpdate.clear();

                          //   showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return const AlertDialog(
                          //           title: Text("Todo"),
                          //           content: Text("Updated successfully"),
                          //         );
                          //       });
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                        )),
                  ))
        ],
      ),
    );
  }
}
