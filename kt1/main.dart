import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(TodoApp());
}

class Todo {
  final int id;
  final String title;
  final String text;

  Todo({
    required this.id,
    required this.title,
    required this.text,
  });
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  void addTodo() {
    final random = Random();
    final newTodo = Todo(
      id: random.nextInt(1000),
      title: 'Todo ${random.nextInt(100)}',
      text: 'Description for todo ${random.nextInt(100)}',
    );

    setState(() {
      todos.add(newTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].text),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
