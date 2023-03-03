import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(children: [
          Expanded(
            child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const HomePage()),
          ),
          NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.list_rounded), label: 'List'),
              NavigationDestination(
                  icon: Icon(Icons.archive), label: 'Archived')
            ],
            selectedIndex: 0,
          ),
        ]),
      );
    });
  }
}
