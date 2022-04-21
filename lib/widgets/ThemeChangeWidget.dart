
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/Global.dart';
import '../common/GmLocalizations.dart';
import '../common/ThemeModel.dart';

class ThemeChangeWidget extends StatelessWidget{
  const ThemeChangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( //显示主题色块
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeModel>(context, listen: false).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}