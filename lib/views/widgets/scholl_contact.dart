import 'package:flutter/material.dart';
import 'package:uni/models/Scholl.dart';
import 'package:url_launcher/url_launcher.dart';

class SchollContact extends StatelessWidget {
  final Scholl scholl;

  SchollContact({@required this.scholl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${scholl.name} - ${scholl.province}',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center),
          RaisedButton.icon(
              onPressed: () => find('tel:${scholl.phone}'),
              icon: Icon(Icons.phone),
              label: Text('Telefon')),
          RaisedButton.icon(
              color: Colors.redAccent[200],
              onPressed: () => find('mailto:${scholl.email}?body=uni app aracılığıyla gönderilmiştir.'),
              icon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              label: Text(
                'E-Posta',
                style: TextStyle(color: Colors.white),
              )),
          RaisedButton.icon(
              color: Colors.cyan[400],
              onPressed: () =>
                  find('https://maps.google.com/?q=${scholl.address}'),
              icon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              label: Text('Harita', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }

  find(url) async {
    await launch(url);
  }
}
