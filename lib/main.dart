import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/widgets/applayout.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: "To-Do List",
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: const Scaffold(
          body: AppLayout(),
        ),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  var currentList = <String>[];

}
