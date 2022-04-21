import 'package:flutter/material.dart';
import '../common/GmLocalizations.dart';
import '../widgets/HomeWidget.dart';
import '../widgets/MyDrawer.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)?.home ?? "home"),
      ),
      body: const HomeWidget(),
      drawer: const MyDrawer(), //抽屉菜单
    );
  }
}
