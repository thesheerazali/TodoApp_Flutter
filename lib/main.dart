import 'package:flutter/material.dart';
import 'package:todolist/pages/splash_screen.dart';

import 'pages/data_input_screen.dart';
import 'pages/todos_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          DataInputScreen.routeName: (context) => DataInputScreen(),
          TodoListPage.routeName: (context) => const TodoListPage(),
        });
  }
}
