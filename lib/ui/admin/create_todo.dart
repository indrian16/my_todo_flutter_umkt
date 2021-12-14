import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "Employee :",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.blueAccent,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownSearch<String>(
              validator: (v) => v == null ? "required field" : null,
              dropdownSearchDecoration: InputDecoration(
                fillColor: Colors.blueAccent,
                hintText: "Select Employee",
                contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              mode: Mode.MENU,
              showSelectedItems: true,
              items: const ["Adi", "Zidan", "Budi", 'Bambang'],
              onChanged: print,
              positionCallback: (popupButtonObject, overlay) {
                final decorationBox = _findBorderBox(popupButtonObject);

                double translateOffset = 0;
                if (decorationBox != null) {
                  translateOffset =
                      decorationBox.size.height - popupButtonObject.size.height;
                }

                final RenderBox overlay = Overlay.of(context)!
                    .context
                    .findRenderObject() as RenderBox;
                return RelativeRect.fromSize(
                  Rect.fromPoints(
                    popupButtonObject
                        .localToGlobal(
                            popupButtonObject.size.bottomLeft(Offset.zero),
                            ancestor: overlay)
                        .translate(0, translateOffset),
                    popupButtonObject.localToGlobal(
                        popupButtonObject.size.bottomRight(Offset.zero),
                        ancestor: overlay),
                  ),
                  Size(overlay.size.width, overlay.size.height),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.note_alt_rounded,
                  color: Colors.blueAccent,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "Todo :",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.blueAccent,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
                elevation: 2.0,
                color: Colors.blueAccent,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  RenderBox? _findBorderBox(RenderBox box) {
    RenderBox? borderBox;

    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }

      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });

    return borderBox;
  }
}
