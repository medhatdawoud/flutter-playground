import 'package:flutter/material.dart';

class TodoItem {
  String todo;
  bool done;

  TodoItem({ required this.todo, required this.done });

  createTodo () {
    return {
      'todo': todo,
      'done': done
    };
  }
}
