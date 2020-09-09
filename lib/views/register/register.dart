import 'package:crossplat_objectid/crossplat_objectid.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni/constants/route_constants.dart';
import 'package:uni/constants/validator.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String name;
  BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      backgroundColor: Color(0xffffffdd),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _welcome,
            SizedBox(height: 20),
            _subtitle,
            SizedBox(height: 20),
            _description,
            SizedBox(height: 20),
            _form
          ],
        ),
      ),
      floatingActionButton: _fab,
    );
  }

  register() async {
    if (formKey.currentState.validate()) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      ObjectId id1 = ObjectId();
      preferences.setString('name', name);
      preferences.setString('userId', id1.toHexString());
      Navigator.of(context).pushNamed(SPLASH_ROUTE);
    }
  }

  Widget get _welcome =>
      Text('Hoş geldin!', style: Theme.of(context).textTheme.headline5);
  Widget get _subtitle => Text('Devam etmeden bize adını söyler misin?',
      style: Theme.of(context).textTheme.headline5);
  Widget get _description => Text('Bu yorumlarda adının gözükmesi içindir.',
      style: Theme.of(context).textTheme.headline4);

  Widget get _form => Form(
        key: formKey,
        child: Column(
          children: <Widget>[_textFormField],
        ),
      );

  Widget get _textFormField => TextFormField(
        onChanged: (val) => setState(() => name = val),
        validator: (val){
            if(val.length <= 3){
              return 'Lütfen en az 3 karakter gir';
            } 
            if(!validCharacters.hasMatch(val)){
              return 'İzin verilmeyen karakterler kullandın';
            }
            return null;
        },
        autovalidate: true,
        decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.black), filled: true),
      );

  Widget get _fab => SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          tooltip: 'Tamamla',
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.check_box_outline_blank),
          onPressed: register,
        ),
      );
}
