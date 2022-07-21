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
        IconButton(
          icon: const Icon(
            Icons.check_box_outlined,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, TodoListPage.routeName);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 5),
          child: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Consumer<TodoListProvider>(
                builder: (context, value, child) => Text(
                  value.todoList.length.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
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
