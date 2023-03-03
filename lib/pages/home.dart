import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text('To-do List'),
        Text('List Item 1'),
        Text('List Item 2'),
        Text('List Item 3'),
        Text('List Item 4'),
        Text('List Item 5'),
      ],
    );
  }
}
