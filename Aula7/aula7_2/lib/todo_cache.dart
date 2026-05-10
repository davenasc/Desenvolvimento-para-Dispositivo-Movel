import 'dart:collection';
import 'package:aula7_2/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:aula7_2/todo.dart';

class TodoCache extends ChangeNotifier {
  var _index = -1;

  final List<Todo> _all = [
    Todo("Item 1", "First to-do of the list"),
    Todo("Item 2", "Second to-do of the list"),
    Todo("Item 3", "Third to-do of the list"),
  ];

  // Adiciona novos items na lista
  void addItem(String title, String descr) {
    _all.add(Todo(title, descr));
    notifyListeners();
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _all.length))
      _index = value;
    else
      _index = -1;
  }

  UnmodifiableListView<Todo> get list => UnmodifiableListView<Todo>(_all);
}
