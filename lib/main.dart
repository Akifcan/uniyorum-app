import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/core/feed.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/models/Scholl.dart';
import 'package:uni/styles/custom_theme.dart';
import 'package:uni/views/app_about/app_about.dart';
import 'package:uni/views/detail/detail.dart';
import 'package:uni/views/home/home.dart';
import 'package:uni/views/search/search.dart';
import 'package:uni/views/splash.dart';
import 'package:uni/views/register/register.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Scholl(),
      ),
      ChangeNotifierProvider(
        create: (context) => Comment(),
      ),
      ChangeNotifierProvider(
        create: (context) => Feed(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uni',
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: Splash(),
      routes: {
        HOME_ROUTE: (context) => Home(),
        SEARCH_ROUTE: (context) => Search(),
        DETAIL_ROUTE: (context) => Detail(),
        REGISTER_ROUTE: (context) => Register(),
        SPLASH_ROUTE: (context) => Splash(),
        APP_ABOUT: (context) => AppAbaout()
      },
    );
  }
}
