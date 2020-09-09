import 'package:flutter/cupertino.dart';

class Feed extends ChangeNotifier{

  bool _showSnackbarPage = false;
  String _text = '';

  bool get showSnackbarPage => _showSnackbarPage;
  String get text => _text;

  setSnackbar(bool val, String text){
    _showSnackbarPage = val;
    _text = text;
    notifyListeners();
  }

  removeSnackbar(){
    _showSnackbarPage = false;
  }
}