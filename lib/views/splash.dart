import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/models/Scholl.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => redirect());
  }

  redirect() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await Provider.of<Scholl>(context, listen: false).mostPoints();
    await Provider.of<Comment>(context, listen: false).getLastComments();
    instance.getString('name') == null
        ? Navigator.of(context).pushNamed(REGISTER_ROUTE)
        : Navigator.of(context).pushNamed(HOME_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffdd),
      body: Center(
        child: Lottie.asset('assets/animations/student.json'),
      ),
    );
  }
}
