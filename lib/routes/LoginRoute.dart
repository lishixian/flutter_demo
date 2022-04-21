import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/LoginWidget.dart';
import '../common/GmLocalizations.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(GmLocalizations.of(context)?.login ?? "login")),
      body: const LoginWidget(),
    );
  }
}
