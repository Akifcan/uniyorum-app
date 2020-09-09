import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/core/feed.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/views/detail/detail_viewmodel.dart';
import 'package:uni/views/research_helper/research_helper.dart';
import 'package:uni/views/widgets/comment_card.dart';
import 'package:uni/views/widgets/detail_chip.dart';
import 'package:uni/views/widgets/scholl_contact.dart';
import '../../dtos/scholl_dto.dart';
import '../do-comment/do_comment.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends DetailViewModel {
    final s = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final SchollDto args = ModalRoute.of(context).settings.arguments;
    scholl = args.scholl;
    print(Provider.of<Feed>(context, listen: false).showSnackbarPage);
    return Consumer<Feed>(
      builder: (context, model, child) {
        if(model.showSnackbarPage == true){
          s.currentState.showSnackBar(SnackBar(content: Text(model.text)));
          model.removeSnackbar();
        }
        return Scaffold(
          appBar: _appBar,
          key: s,
          body: Column(
            children: <Widget>[
              SizedBox(height: 20),
              DetailChip(
                  title: 'Verilen Puan ${scholl.totalPoint}', function: () {}),
              SizedBox(height: 5),
              DetailChip(
                  title: 'Yorum Yap',
                  function: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DoComment(schollId: scholl.id)))),
              DetailChip(
                title: 'Araştırma Yardımcısı',
                function: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResearchHelper(
                          schollName: scholl.name,
                        ))),
              ),
              DetailChip(title: 'İletişim Bilgileri', function: showDetails),
              SizedBox(height: 30),
              _listComments
            ],
          ),
        );
      },
    );
  }

  showDetails() {
    return showModalBottomSheet(
        context: context, builder: (context) => SchollContact(scholl: scholl));
  }

  Widget get _appBar => AppBar(
        title: Text(scholl.name),
      );

  Widget get _listComments => Expanded(
        child: ListView.builder(
            itemCount: Provider.of<Comment>(context).comments.length,
            itemBuilder: (context, index) => CommentCard(
                comment: Provider.of<Comment>(context).comments[index])),
      );
}
