import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_todo/data/domain/model/todo.dart';

class HomeListTodoItem extends StatelessWidget {
  final Todo todo;

  const HomeListTodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsetsDirectional.all(8.0),
        width: double.infinity,
        height: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.folder,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 8.0),
                Text(
                  todo.title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.blueAccent),
                ),
                const Spacer(),
                Text(
                  '1h ago',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.blueAccent),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            buildTodoStateWidget(context, todo)
          ],
        ),
      ),
    );
  }

  Widget buildTodoStateWidget(BuildContext context, Todo todo) {
    Color colorState = Colors.grey;
    switch (todo.progress) {
      case 'None':
        colorState = Colors.grey;
        break;
      case 'Progress':
        colorState = Colors.orange;
        break;
      case 'Done':
        colorState = Colors.blueAccent;
        break;
      default:
        colorState = Colors.grey;
        break;
    }
    return MaterialButton(
      elevation: 0.0,
      color: colorState,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: () {
        showSetTodoModalBottomSheet(context);
      },
      child: Text(
        todo.progress,
        style: Theme.of(context).textTheme.button?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Future<dynamic> showSetTodoModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        barrierColor: Colors.grey.withOpacity(0.5),
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            height: 350,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Set Progress',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'None',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    leading: Radio(
                      value: 'None',
                      groupValue: 'None',
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Card(
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'On Progress',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    leading: Radio(
                      value: 'Progress',
                      groupValue: 'None',
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Card(
                  elevation: 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Done',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    leading: Radio(
                      value: 'Done',
                      groupValue: 'None',
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          );
        });
  }
}
