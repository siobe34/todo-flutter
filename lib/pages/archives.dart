import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/main.dart';

class ArchivesPage extends StatefulWidget {
  const ArchivesPage({super.key});

  @override
  State<ArchivesPage> createState() => _ArchivesPageState();
}

class _ArchivesPageState extends State<ArchivesPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    // var theme = Theme.of(context);
    // var inputStyle = theme.textTheme.bodyMedium!.copyWith(
    //   fontSize: 18,
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Archives List"),
        elevation: 4,
        actions: [
          ElevatedButton(
              onPressed: () {
                appState.deleteArchives();
              },
              child: const Text('Delete All')),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var item in appState.archivesList) Text(item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
