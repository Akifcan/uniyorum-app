import 'package:flutter/material.dart';
import 'package:uni/models/Comment.dart';

class LastComment extends StatelessWidget {

  final Comment comment;

  LastComment({@required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 300,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        comment.comment.length >= 100 ? comment.comment.substring(0, 70) : comment.comment,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${comment.name[0]}${comment.name.substring(1)} | ${comment.givenPoint.toString()} Puan',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                      Text(comment.schollName, overflow: TextOverflow.ellipsis)
                    ],
                  ),
                ),
              ),
            );
  }
}
