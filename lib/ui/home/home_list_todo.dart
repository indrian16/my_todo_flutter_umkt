import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_todo/data/domain/model/todo.dart';
import 'package:my_todo/ui/home/home_list_todo_item.dart';

class HomeListTodo extends StatefulWidget {
  const HomeListTodo({Key? key}) : super(key: key);

  @override
  _HomeListTodoState createState() => _HomeListTodoState();
}

class _HomeListTodoState extends State<HomeListTodo> {
  final todos = [
    Todo(
      'Slicing Checkout Feature',
      'createAt',
      'Done',
    ),
    Todo(
      'Integration Checkout Feature',
      'createAt',
      'Progress',
    ),
    Todo(
      'Setup Circle CI',
      'createAt',
      'None',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return HomeListTodoItem(
            todo: todos[index],
          );
        });
  }
}
