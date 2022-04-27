import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/CupertinoTabRoute.dart';
import 'package:flutter_demo/widgets/DemoApp.dart';
import 'package:flutter_demo/widgets/FadeAppTest.dart';
import 'package:flutter_demo/widgets/LifecycleWatcher.dart';
import 'package:flutter_demo/widgets/MainTestPage.dart';
import 'package:flutter_demo/widgets/SampleApp.dart';
import 'package:flutter_demo/widgets/SampleApp2.dart';
import 'package:flutter_demo/widgets/SampleApp3.dart';
import 'package:flutter_demo/widgets/TouchMoveView.dart';
import 'package:flutter_demo/widgets/TouchMoveView2.dart';
import 'package:flutter_demo/widgets/ZoomImage.dart';
import 'package:flutter_demo/widgets/paint_demo.dart';
import 'routes/HomeTabRoute.dart';
import 'widgets/LoginWidget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'common/Global.dart';
import 'common/GmLocalizations.dart';
import 'common/GmLocalizationsDelegate.dart';
import 'common/LocaleModel.dart';
import 'common/ThemeModel.dart';
import 'common/UserModel.dart';
import 'routes/HomeRoute.dart';
import 'routes/LanguageRoute.dart';
import 'routes/LoginRoute.dart';
import 'routes/ThemeChangeRoute.dart';
import 'routes/DrawingPageRoute.dart';
import 'routes/ParticlePageRoute.dart';
import 'routes/DragImgRoute.dart';

Map<String, WidgetBuilder> routers = {
  "地图裁剪-可拖拉和缩放": (context) => const PaintDemo(),
  "图片效果--可拖拉和缩放": (context) => const ZoomImage(key: Key("adfadsfa"),),
  "裁剪图片效果,可拖拉位置和缩放": (context) => const MainTestPage(),
  "可拖动控件": (context) => const TouchMoveView2(),
  "生命周期": (context) => const LifecycleWatcher(),
  "将任务转移到后台线程": (context) => const SampleApp3(),
  "异步 UI": (context) => const SampleApp2(),
  "使用 Canvas 进行绘制": (context) => const DemoApp(),
  "home": (context) => const HomeRoute(),
  "login": (context) => const LoginRoute(),
  "themes": (context) => const ThemeChangeRoute(),
  "language": (context) => const LanguageRoute(),
  "绘制路径": (context) => const DrawingPageRoute(),
  "粒子动画效果": (context) => const ParticlePageRoute(),
  "结合 Matrix 的拖拽": (context) => const DragImgRoute(),
  "Tab_PageTransitionSwitcher": (context) => const HomeTabRoute(),
  "--主页--Tab_Cupertino": (context) => const CupertinoTabRoute(),
  "LoginWidget": (context) => const LoginWidget(),
  "布局中添加或删除一个组件": (context) => const SampleApp(),
  "Widget 如何实现动画": (context) => const FadeAppTest(),
};

void main() {
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
            onGenerateTitle: (context) {
              return GmLocalizations.of(context)?.title ?? "title";
            },
            home: const MyHomePage(title: 'Flutter Demo'),
            builder: EasyLoading.init(),
            locale: localeModel.getLocale(),
            //我们只支持美国英语和中文简体
            supportedLocales: const [
              Locale('en', 'US'), // 美国英语
              Locale('zh', 'CN'), // 中文简体
              //其它Locales
            ],
            localizationsDelegates: const [
              // 本地化的代理类
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate()
            ],
            localeResolutionCallback: (_locale, supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale = _locale!;
                } else {
                  //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  locale = const Locale('en', 'US');
                }
                return locale;
              }
            },
            // 注册路由表
            routes: routers,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var routeLists = routers.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Text(routeLists[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ),
    );
  }
}
