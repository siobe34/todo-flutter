import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/main.dart';

class ArchiveItem extends StatefulWidget {
  const ArchiveItem({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ArchiveItem> createState() => _ArchiveItemState();
}

class _ArchiveItemState extends State<ArchiveItem> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    var theme = Theme.of(context);

    var normalTextStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 18,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
                child: Text(
              widget.text,
              style: normalTextStyle,
            )),
            IconButton(
              onPressed: () {
                appState.removeItem(widget.text);
              },
              icon: const Icon(Icons.delete_rounded),
            )
          ],
        ),
      ),
    );
  }
}
