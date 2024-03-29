// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:provider/provider.dart';
// import 'package:todolist/providers/todo_list_provider.dart';

// class ItemWidget extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TodoListProvider>(
//       builder: (context, todosListProvider, child) => Card(
//         child: ListTile(
//           onTap: () {},
//           leading: const Icon(Icons.today_outlined),

//           title: Text(todosListProvider.todoList[index].title),
//           subtitle:
//               Text(todosListProvider.todoList[index].description.toString()),

//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/titke_decs.dart';

import '../providers/text_controller_provider.dart';
import '../providers/todo_list_provider.dart';

class TodoListTile {
  



  listTileTodo(context, index) {
    final textControler = Provider.of<TextControlerProvider>(context, listen: false);
    return Consumer<TodoListProvider>(
        builder: (context, todosListProvider, child) => Card(
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
                         
                title: todosListProvider.check! ? TitleDesc.titleWidget(
                  todosListProvider.todoList[index].title) : TitleDesc.titleWidget(
                 textControler.titleFieldControllerUpdate.text ),
             
                //  Text(

                //   todosListProvider.todoList[index].title,
                //   style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                subtitle:todosListProvider.check! ? TitleDesc.titleWidget(
                  todosListProvider.todoList[index].description) : TitleDesc.titleWidget(
                   textControler.descriptionFieldControllerUpdate.text),

                // Text(
                //    todosListProvider.todoList[index].description,
                //   style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //   ),
                // ),
                trailing: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    todosListProvider.todoList[index].id.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ));
  }
}
