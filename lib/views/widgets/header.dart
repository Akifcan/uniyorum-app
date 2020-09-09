import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/models/Scholl.dart';

class Header extends StatefulWidget {
  bool isHomePage = false;
  Header({this.isHomePage});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _title,
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _search),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget get _title => Text('Uni', style: Theme.of(ctx).textTheme.headline1);

  Widget get _search => widget.isHomePage
      ? GestureDetector(
          child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Text('Okul Arayın')),
          onTap: () => Navigator.of(ctx).pushNamed(SEARCH_ROUTE))
      : _textField;

  Widget get _textField => TextField(
        onChanged: (val) {
          if (val.length > 3) {
            Provider.of<Scholl>(context, listen: false).searchScholl(val);
          }
          if(val.isEmpty){
            Provider.of<Scholl>(context, listen: false).getScholls();
          }
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(15.0),
              ),
            ),
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            hintText: "Okul Arayın",
            fillColor: Colors.white),
      );
}
