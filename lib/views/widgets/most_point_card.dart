import 'package:flutter/material.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/dtos/scholl_dto.dart';
import 'package:uni/models/Scholl.dart';

class MostPointCard extends StatelessWidget {
  BuildContext ctx;
  final Scholl scholl;

  MostPointCard({@required this.scholl});

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Card(
      child: Column(
        children: <Widget>[_schollName, _totalPoint, _listComments],
      ),
    );
  }

  Widget get _schollName => Container(
        padding: const EdgeInsets.all(12),
        color: Theme.of(ctx).primaryColor,
        width: double.infinity,
        child: Center(
            child: Text(
          scholl.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      );

  Widget get _totalPoint => Container(
        height: 100,
        width: double.infinity,
        child: Center(
            child: Text('Toplam Puan: ${scholl.totalPoint.toString()}',
                style: Theme.of(ctx).textTheme.headline2)),
      );

  Widget get _listComments => Container(
        width: double.infinity,
        child: RaisedButton(
          color: Theme.of(ctx).primaryColor,
          textColor: Colors.white,
          child: Text('Yorumları Oku'),
          onPressed: () => Navigator.of(ctx).pushNamed(DETAIL_ROUTE, arguments: SchollDto(scholl: scholl)),
        ),
      );
}
