import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:uni/constants/api_constants.dart';

class Comment extends ChangeNotifier {

  final String name;
  final int givenPoint;
  final String comment;
  final String createdAt;
  final String userId;
  final String schollId;
  final String id;
  final String schollName;

  Comment({this.id, this.name, this.givenPoint, this.comment, this.createdAt, this.userId, this.schollId, this.schollName});

  List<Comment> lastComments = [];
  List<Comment> comments = [];

  factory Comment.fromJson(Map json){
    return Comment(
      id: json['_id'],
      name: json['name'],
      givenPoint: json['givenPoint'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      userId: json['userId'],
      schollId: json['schollId'],
    );
  }

  factory Comment.withSchollInfo(Map json){
    return Comment(
      id: json['_id'],
      name: json['name'],
      givenPoint: json['givenPoint'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      userId: json['userId'],
      schollId: json['schollId'],
      schollName: json['scholl'][0]['name']
    ); 
  }

  doComment(int givenPoint, String comment, String schollId) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String name = instance.getString('name');
    String userId = instance.getString('userId');
    var response = await http.post('$API_URL/comment/$schollId/$userId', body: {
      "name": name,
      "givenPoint": givenPoint.toString(),
      "comment": comment
    });
    var data = jsonDecode(response.body);
    return data['status'];
  }

  getLastComments() async{
    var response = await http.get('$API_URL/last-comments');
    List data = jsonDecode(response.body);
    print(data);
    lastComments = data.map((comment) => Comment.withSchollInfo(comment)).toList();
    notifyListeners();
  }

  commentsByScholl(String schollId) async{
    var response = await http.get('$API_URL/comments/$schollId');
    List data = jsonDecode(response.body);
    comments = data.map((comment) => Comment.fromJson(comment)).toList();
    notifyListeners();
  }
}
