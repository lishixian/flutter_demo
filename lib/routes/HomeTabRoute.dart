import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/LanguageWidget.dart';
import 'package:flutter_demo/widgets/ThemeChangeWidget.dart';
import '../common/GmLocalizations.dart';
import '../widgets/HomeWidget.dart';
import '../widgets/MyDrawer.dart';

class HomeTabRoute extends StatefulWidget {
  const HomeTabRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeTabRoute> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)?.home ?? "home"),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: AppPagelist[_selectedIndex],
          //),
        ),
      ),
      //drawer: const MyDrawer(), //抽屉菜单
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Language'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Theme'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  List<Widget> AppPagelist = [
    const HomeWidget(),
    const LanguageWidget(),
    const ThemeChangeWidget(),
  ];
}
