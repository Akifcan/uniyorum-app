import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResearchHelper extends StatefulWidget {
  final String schollName;

  ResearchHelper({@required this.schollName});

  @override
  _ResearchHelperState createState() => _ResearchHelperState();
}

class _ResearchHelperState extends State<ResearchHelper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.schollName)),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Stack(
              children: <Widget>[_bannerImage, _description],
            ),
          ),
          SizedBox(height: 20),
          RaisedButton(
            color: Color(0xff81C14B),
            child: Text('Ekşi Sözlük', style: TextStyle(color: Colors.white)),
            onPressed: () => navigate('https://www.google.com/search?q=${widget.schollName} site: eksisozluk.com'),
          ),
          RaisedButton(
            color: Color(0xffFF0000),
            child: Text('Youtube', style: TextStyle(color: Colors.white)),
            onPressed: () => navigate('https://www.youtube.com/results?search_query=${widget.schollName}')
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text('Haberler', style: TextStyle(color: Colors.white)),
            onPressed: () => navigate('https://www.google.com/search?q=${widget.schollName}')
          ),
          RaisedButton(
            color: Color(0xff1DA1F2),
            child: Text('Twitter', style: TextStyle(color: Colors.white)),
            onPressed: () => navigate('https://twitter.com/search?q=${widget.schollName}&src=typed_query'),
          )
        ],
      ),
    );
  }

  navigate(String path) async{
    await launch(path);
  }

  Widget get _bannerImage => ColorFiltered(
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.colorBurn),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('assets/images/research.jpg'),
            fit: BoxFit.cover,
          )),
        ),
      );

  Widget get _description => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Araştırma Yardımcısı Nedir?',
                    style: Theme.of(context).textTheme.headline1),
                Text(
                    'Araştırma yardımcısı ile araştırmak istediğiniz üniversite hakkında yorumları görüntüleyebileceğiniz kısayolları sunar.',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                    ))
              ],
            )),
      );
}
