import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/LoginWidget.dart';
import '../widgets/widget0.dart';
import '../widgets/widget1.dart';
import '../widgets/widget2.dart';

// Map<String, WidgetBuilder> routers = {
//   "Widget01": (context) => const Widget01(
//     title: 'Widget01',
//   ),
//   "Widget02": (context) => const Widget02(
//     title: 'Widget02',
//   ),
//   "Widget03": (context) => const Widget03(
//     title: 'Widget03',
//   ),
//   "LoginWidget": (context) => const LoginWidget(),
// };

class CupertinoTabRoute extends StatelessWidget {
  const CupertinoTabRoute({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _HomeTabRoute(),
      //routes: routers,
      // routes: {
      //   "login_widget": (context) => const LoginWidget(),
      //   "LoginWidget": (context) => const LoginWidget(),
      // },
    );
  }
}

class _HomeTabRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: CupertinoTabScaffold(
        controller: CupertinoTabController(
          initialIndex: 1,
        ),
        restorationId: 'cupertino_tab_scaffold',
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.create)),
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
              restorationScopeId: 'cupertino_tab_view_$index',
              //routes: routers,
              // routes: {
              //   "login_widget": (context) => const LoginWidget(),
              //   "LoginWidget": (context) => const LoginWidget(),
              // },
              builder: (context) {
                switch (index) {
                  case 0:
                    return const Widget0(
                      title: 'Widget0',
                    );
                  case 1:
                    return const Widget1();
                  case 2:
                    return const Widget2(
                      title: 'Widget2',
                    );
                  default:
                    return Container();
                }
              });
        },
      ),
    );
  }
}
