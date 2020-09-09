import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/models/Scholl.dart';
import 'package:uni/views/detail/detail.dart';

abstract class DetailViewModel extends State<Detail>{
  Scholl scholl;
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      Provider.of<Comment>(context, listen: false).commentsByScholl(scholl.id);
    });
  }
}