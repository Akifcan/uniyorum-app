import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/views/do-comment/do_comment_viewmodel.dart';
import 'package:uni/views/widgets/detail_chip.dart';

class DoComment extends StatefulWidget {
  final String schollId;
  DoComment({@required this.schollId});
  @override
  _DoCommentState createState() => _DoCommentState();
}

class _DoCommentState extends DoCommentViewModel {
  int point;
  String comment;
  Comment commentModel = Comment();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yorum Yap'),
        centerTitle: true,
      ),
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text('Puan Verin',
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DetailChip(
                          title: '1',
                          function: () => setState(() => point = 1),
                          color: Colors.red[800]),
                      DetailChip(
                          title: '2',
                          function: () => setState(() => point = 2),
                          color: Colors.red[600]),
                      DetailChip(
                          title: '3',
                          function: () => setState(() => point = 3),
                          color: Colors.yellow[900]),
                      DetailChip(
                          title: '4',
                          function: () => setState(() => point = 4),
                          color: Colors.green[500]),
                      DetailChip(
                          title: '5',
                          function: () => setState(() => point = 5),
                          color: Colors.green[700]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                          point == 1
                              ? 'Çok Kötü'
                              : point == 2
                                  ? 'Kötü'
                                  : point == 3
                                      ? 'İdare Eder'
                                      : point == 4 ? 'İyi' :  point == 5 ? 'Çok İyi' : '',
                          style: Theme.of(context).textTheme.headline3)),
                  SizedBox(height: 20),
                  Text('Yorumun', style: GoogleFonts.montserrat(fontSize: 18)),
                  TextFormField(
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Lütfen yorumunuzu yazın";
                      }
                      if (val.length <= 10) {
                        return "Yorumunuz en az 10 karakter içermeli";
                      }
                      return null;
                    },
                    onChanged: (val) {
                      scrollToBottom();
                      setState(() => comment = val);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      prefixText: 'Bu puanı verme sebebim:',
                    ),
                    maxLines: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton.icon(
                      onPressed: () async {
                        if (point == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                  title: Text('Lütfen puan verin')));
                        }
                        if (formKey.currentState.validate() && point != null)  {
                          var result = await commentModel.doComment(point, comment, widget.schollId);
                          if(result){
                            Provider.of<Comment>(context, listen: false).getLastComments();
                            redirectBack();
                          }
                        }
                      },
                      icon: Icon(Icons.arrow_right,
                          color: Colors.white, size: 30),
                      label: Text('Yorumumu Gönder',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
