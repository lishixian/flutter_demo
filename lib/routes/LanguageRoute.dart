
import 'package:flutter/material.dart';
import '../common/GmLocalizations.dart';
import '../widgets/LanguageWidget.dart';

class LanguageRoute extends StatelessWidget {
  const LanguageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)?.language ?? "language"),
      ),
      body: const LanguageWidget(),
    );
  }
}