import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/todos_list_page.dart';
import '../providers/todo_list_provider.dart';

class TodosCountButton extends StatelessWidget {
  const TodosCountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //  alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: const Icon(
              Icons.check_box_outlined,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, TodoListPage.routeName);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 5),
          child: Container(
            height: 23,
            width: 23,
            decoration: BoxDecoration(
              color: Colors.cyan,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: Consumer<TodoListProvider>(
                builder: (context, value, child) => Text(
                  value.todoList.length.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black
                      // color: Colors.blueGrey,
                      ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
