import 'package:flutter/material.dart';

import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/archives.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const ArchivesPage();
        break;
      default:
        throw UnimplementedError('No widget for index: $selectedIndex.');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(children: [
          Expanded(
            child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page),
          ),
          NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.list_rounded), label: 'List'),
              NavigationDestination(
                  icon: Icon(Icons.archive), label: 'Archived')
            ],
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedIndex: selectedIndex,
          ),
        ]),
      );
    });
  }
}
