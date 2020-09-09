import 'package:flutter/material.dart';

class Breadcrumb extends StatelessWidget {

  final String title;

  Breadcrumb({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.headline2)
          ],
        ));
  }
}
