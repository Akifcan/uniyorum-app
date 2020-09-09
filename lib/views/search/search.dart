import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/dtos/scholl_dto.dart';
import 'package:uni/models/Scholl.dart';
import 'package:uni/views/search/search_viewmodel.dart';
import 'package:uni/views/widgets/header.dart';
import 'package:uni/views/widgets/search_loader.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends SearchViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Header(
          isHomePage: false,
        ),
        _list
      ],
    ));
  }

  Widget get _list => Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Provider.of<Scholl>(context).scholls.length > 0 ? ListView.builder(
                itemCount: Provider.of<Scholl>(context).scholls.length,
                itemBuilder: (context, index) {
                  Scholl scholl = Provider.of<Scholl>(context).scholls[index];
                  return ListTile(
                    onTap: () => Navigator.of(context).pushNamed(DETAIL_ROUTE, arguments: SchollDto(scholl: scholl)),
                    leading: CircleAvatar(radius: 40.0,child: Text('${scholl.name.split(' ')[0][0]}${scholl.name.split(' ')[1][0]}', style: GoogleFonts.adamina(fontSize: 20),)),
                    title: Text(scholl.name.substring(0, 15), style: Theme.of(context).textTheme.headline2,  overflow: TextOverflow.ellipsis),
                    subtitle: Wrap(
                      children: <Widget>[
                        Text('Puan '+scholl.totalPoint.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(width: 20),
                        Text(scholl.province, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                  );
                }) : Center(child: SearchLoader()),
        )
      );
}
