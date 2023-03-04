import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/main.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool itemCompleted = false;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    var theme = Theme.of(context);

    var normalTextStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 18,
    );

    var strikethroughTextStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 18,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.lineThrough,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
              value: itemCompleted,
              onChanged: (bool? value) {
                setState(() {
                  itemCompleted = value!;
                });
              },
            ),
            Expanded(
              child: Text(
                widget.text,
                style: itemCompleted ? strikethroughTextStyle : normalTextStyle,
              ),
            ),
            IconButton(
              onPressed: () {
                appState.moveToArchive(widget.text);
              },
              icon: const Icon(Icons.archive),
            )
          ],
        ),
      ),
    );
  }
}
