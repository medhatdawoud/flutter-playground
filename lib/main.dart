import 'package:flutter/material.dart';
import 'package:flutterapp/todo_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> todos = [];
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text('Todo list, PP')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        todos[index].done = !todos[index].done;
                      });
                    },
                    title: Center(
                      child: Text(
                        todos[index].todo,
                        style: TextStyle(
                            decoration: todos[index].done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color:
                                todos[index].done ? Colors.grey : Colors.black),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add(TodoItem(
                done: false, todo: 'This is my TODO list item number $count'));
            count++;
          });
        },
        child: Text('Add'),
        backgroundColor: count > 5 ? Colors.green : Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
