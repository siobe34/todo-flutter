import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/main.dart';
import 'package:todo_app/widgets/listitem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do List"),
        elevation: 4,
      ),
      body: ListView(
        children: [
          const ListItem(text: 'List Item 1'),
          const ListItem(text: 'List Item 2'),
          const ListItem(text: 'List Item 3'),
          const ListItem(text: 'List Item 4'),
          const ListItem(text: 'List Item 5'),
          const ListItem(text: 'List Item 5.1'),
          const ListItem(text: 'List Item 5.2'),
          const ListItem(text: 'List Item 5.3'),
          for (var item in appState.currentList) ListItem(text: item),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.addItem('List Item 6');
                },
                child: const Text("Add Item"),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  appState.removeItem('List Item 6');
                },
                child: const Text("Remove Item"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
