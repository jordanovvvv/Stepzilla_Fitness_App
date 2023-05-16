import 'package:flutter/cupertino.dart';
import 'package:stepzilla/widgets/LoginWidget.dart';
import 'package:stepzilla/widgets/SignUpWidget.dart';

class AuthPage extends StatefulWidget{

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickSignUp: toggle)
      : SignUpWidget(onClickSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);

}