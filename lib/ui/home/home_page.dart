import 'package:flutter/material.dart';
import 'package:my_todo/ui/admin/create_todo_page.dart';
import 'package:my_todo/ui/home/home_list_todo.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withOpacity(0.08),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 2),
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
      body: HeadSection(title: title, child: const HomeListTodo()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const CreateTodoPage(
                  title: 'Create Todo',
                );
              },
            ),
          );
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        elevation: 5,
        highlightElevation: 10,
      ),
    );
  }
}

class HeadSection extends StatelessWidget {
  final String title;
  final Widget child;
  const HeadSection({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.blueAccent.withOpacity(0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 16.0),
          Expanded(child: child)
        ],
      ),
    );
  }
}
