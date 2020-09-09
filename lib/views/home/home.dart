import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/models/Scholl.dart';
import 'package:uni/views/home/home_viewmodel.dart';
import 'package:uni/views/widgets/breadcrumb.dart';
import 'package:uni/views/widgets/header.dart';
import 'package:uni/views/widgets/last_comment.dart';
import 'package:uni/views/widgets/most_point_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Header(isHomePage: true,),
        SizedBox(height: 20),
        Breadcrumb(title: 'Son Yorumlar'),
        SizedBox(height: 10),
        _lastComments,
        SizedBox(height: 20),
        Breadcrumb(title: 'En Çok Puan Alan Okullar'),
        _mostPoints,
      ],
    ));
  }

  Widget get _lastComments => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 120,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Provider.of<Comment>(context).lastComments.length,
            itemBuilder: (context, index) => LastComment(comment: Provider.of<Comment>(context).lastComments[index])
          ),
        );

  Widget get _mostPoints => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              itemCount: Provider.of<Scholl>(context).mostPointScholl.length,
              itemBuilder: (context, index){
                if(index == 4){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(onTap: () => Navigator.of(context).pushNamed(APP_ABOUT), child: Text('Uygulama Hakkında', style: GoogleFonts.montserrat(color: Colors.blue))),
                      )
                    ],
                  );
                }else{
                  return MostPointCard(scholl: Provider.of<Scholl>(context).mostPointScholl[index]);
                }
              }
            ),
          ),
        );
}
