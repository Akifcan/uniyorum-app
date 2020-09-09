import 'package:flutter/material.dart';

class DetailChip extends StatelessWidget {

  final String title;
  final Function function;
  final Color color;

  DetailChip({this.title, this.function, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ActionChip(
          onPressed: function,
      elevation: 2,
      backgroundColor: color == null ? Theme.of(context).primaryColor : color,
      labelStyle: TextStyle(fontSize: 18),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      label: Text(title, style: TextStyle(color: Colors.white)),
    ));
  }
}
