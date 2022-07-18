import 'package:flutter/material.dart';

import '../constants/images.dart';
import '../data/todos.dart';

class TodoListPage extends StatelessWidget {
  static const String routeName = 'todos-list-page';
  const TodoListPage({Key? key}) : super(key: key);

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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: Todos.todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: const Icon(Icons.today_outlined,size: 30,),
                        title: Text(Todos.todos[index].title),
                        subtitle: Text(Todos.todos[index].description),
                        trailing: const Icon(
                          Icons.check_box,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }
}
