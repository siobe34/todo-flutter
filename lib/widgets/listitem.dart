import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 18,
        );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
