import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/models/Comment.dart';
import 'package:uni/views/do-comment/do_comment.dart';

abstract class DoCommentViewModel extends State<DoComment> {
  ScrollController scrollController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 5), curve: Curves.elasticOut);
  }

  redirectBack(){
      Provider.of<Comment>(context, listen: false).commentsByScholl(widget.schollId);
    Navigator.of(context).pop();
  }
}
