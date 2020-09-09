import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/models/Scholl.dart';
import 'package:uni/views/search/search.dart';

abstract class SearchViewModel extends State<Search>{

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      Provider.of<Scholl>(context, listen: false).getScholls();
    });
  }

}