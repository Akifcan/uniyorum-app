import 'package:flutter/material.dart';
import 'package:uni/models/Scholl.dart';
import '../../constants/route_constants.dart';
import '../../dtos/scholl_dto.dart';

class SearchCard extends StatelessWidget {

  final Scholl scholl;

  SearchCard({this.scholl});

  BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(DETAIL_ROUTE, arguments: SchollDto(scholl: scholl)),
          child: Card(
        child: Container(
          height: 150,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _avatar,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _schollName,
                  SizedBox(height: 10),
                  _schollDetail,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _avatar => Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 5),
            borderRadius: BorderRadius.circular(40)),
        child: CircleAvatar(
          backgroundColor: Colors.white70,
          radius: 40,
          child: Text('${scholl.name.split(' ')[0][0]}${scholl.name.split(' ')[1][0]}', style: Theme.of(ctx).textTheme.headline6),
        ),
      );

  Widget get _schollName =>
      Text(scholl.name.substring(0, 15), style: Theme.of(ctx).textTheme.headline2,  overflow: TextOverflow.ellipsis);

  Widget get _schollDetail => Wrap(
        children: <Widget>[
          Icon(Icons.location_on, color: Theme.of(ctx).primaryColor),
          Text('Province | ${scholl.totalPoint}', style: Theme.of(ctx).textTheme.headline3)
        ],
      );
}
