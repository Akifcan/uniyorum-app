import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAbaout extends StatefulWidget {
  AppAbaout({Key key}) : super(key: key);

  @override
  _AppAbaoutState createState() => _AppAbaoutState();
}

class _AppAbaoutState extends State<AppAbaout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uni | SeaApi'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            RaisedButton(
              onPressed: ()async{
                await launch('https://sea-api.herokuapp.com/');
              },
              textColor: Colors.white,
              child: Text('Sea Api', style: GoogleFonts.play()),
              color: Color(0xff006994),
            ),
             RaisedButton(
              onPressed: ()async{
                await launch('https://www.flaticon.com/free-icon/graduation_3173841?term=university&page=1&position=16');
              },
              textColor: Colors.white,
              child: Text('App Icon By Freepik', style: GoogleFonts.montserrat()),
              color: Colors.blue[700],
            ),
             RaisedButton(
              onPressed: ()async{
                await launch('https://lottiefiles.com/21270-student');
              },
              textColor: Colors.white,
              child: Text('Splash animation lottie by Kishor A', style: GoogleFonts.montserrat()),
              color: Colors.green[500]
            ),
          ],
        ),
      ),
    );
  }
}