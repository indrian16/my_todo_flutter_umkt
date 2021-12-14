import 'package:flutter/material.dart';
import 'package:my_todo/ui/admin/create_todo.dart';
import 'package:my_todo/ui/home/home_page.dart';

class CreateTodoPage extends StatelessWidget {
  final String title;

  const CreateTodoPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.withOpacity(0.08),
          elevation: 0.0,
        ),
        body: HeadSection(title: title, child: const CreateTodo()));
  }
}
