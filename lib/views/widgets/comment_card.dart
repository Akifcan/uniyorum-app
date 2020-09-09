import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uni/core/feed.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/models/Report.dart';
import 'package:uni/views/detail/detail.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  CommentCard({@required this.comment});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(comment.createdAt);
    return Card(
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(child: Text('${comment.name[0].toUpperCase()}')),
        title: Text(comment.comment),
        subtitle: Text('${comment.name} | Verilen Puan ${comment.givenPoint}',
            style: Theme.of(context).textTheme.headline4),
        trailing: IconButton(
          tooltip: 'Bu yorumu rapor et',
          icon: Icon(Icons.warning),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      buttonPadding: const EdgeInsets.all(0),
                      title: Text('Yorumu rapor et',
                          style: GoogleFonts.montserrat()),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Yorum İçeriği:',
                              style: GoogleFonts.montserrat()),
                          Text(comment.comment,
                              style:
                                  GoogleFonts.montserrat(color: Colors.grey)),
                          Wrap(
                            children: <Widget>[
                              Text('Yorumu Yapan Kişi: ',
                                  style: GoogleFonts.montserrat()),
                              Text('${comment.name[0].toUpperCase()}${comment.name.substring(1)}',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(height: 20),
                          Text('Yorum Tarihi:' +
                              DateFormat.yMMMd().format(dateTime)),
                          RaisedButton(
                            color: Colors.red[400],
                            textColor: Colors.white,
                            child: Text('Hakaret içeren yorum'),
                            onPressed: () {
                              Report.reportComment(comment.id, comment.userId,
                                  'Hakaret içeren yorum');
                              Navigator.of(context).pop();
                              Provider.of<Feed>(context, listen: false).setSnackbar(true, 'Raporunuz bize ulaşmıştır');
                            },
                          ),
                          RaisedButton(
                            color: Colors.red[600],
                            textColor: Colors.white,
                            child: Text('Troll içerik'),
                            onPressed: () {
                              Report.reportComment(
                                  comment.id, comment.userId, 'Troll içerik');
                              Navigator.of(context).pop();
                              Provider.of<Feed>(context, listen: false).setSnackbar(true, 'Raporunuz bize ulaşmıştır');
                             
                            },
                          ),
                          RaisedButton(
                            color: Colors.red[800],
                            textColor: Colors.white,
                            child: Text('Yanlış bilgi'),
                            onPressed: () async {
                              await Report.reportComment(
                                  comment.id, comment.userId, 'Yanlış bilgi');
                              Navigator.of(context).pop();
                              Provider.of<Feed>(context, listen: false).setSnackbar(true, 'Raporunuz bize ulaşmıştır');
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                child: Text('Kapat'),
                                onPressed: () => Navigator.of(context).pop(),
                              ))
                            ],
                          )
                        ],
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
