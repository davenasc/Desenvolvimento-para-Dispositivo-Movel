import 'package:aula7_2/todo_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoCache(),
      builder: (context, child) {
        return Scaffold(body: TodoListView());
      },
    );
  }
}

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoCache>(
      builder: (context, cache, child) {
        return Center(child: Text("${cache.list[0].title} is"));
      },
    );
  }
}
