import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/ThemeChangeWidget.dart';
import '../common/GmLocalizations.dart';

class ThemeChangeRoute extends StatelessWidget{
  const ThemeChangeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)?.theme ?? "theme"),
      ),
      body: const ThemeChangeWidget()
    );
  }
}