import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/main.dart';
import 'package:todo_app/widgets/listitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController listController = TextEditingController();

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var theme = Theme.of(context);
    var inputStyle = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontSize: 18,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do List"),
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var item in appState.currentList) ListItem(text: item),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: listController,
              style: inputStyle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add an Item',
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.addItem(listController.text);
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
