import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/CupertinoTabRoute.dart';
import 'package:flutter_demo/widgets/ButtonPage.dart';
import 'package:flutter_demo/widgets/CylinderChart.dart';
import 'package:flutter_demo/widgets/CanvasDemo.dart';
import 'package:flutter_demo/widgets/DemoFlowMenu.dart';
import 'package:flutter_demo/widgets/DemoFlowPopMenu.dart';
import 'package:flutter_demo/widgets/SliverAppBarDemo.dart';
import 'package:flutter_demo/widgets/WidgetDemo.dart';
import 'package:flutter_demo/widgets/DrawingBoard.dart';
import 'package:flutter_demo/widgets/FadeAppTest.dart';
import 'package:flutter_demo/widgets/FlowDemo.dart';
import 'package:flutter_demo/widgets/IndexedStackDemo.dart';
import 'package:flutter_demo/widgets/InheritedWidgetDemo.dart';
import 'package:flutter_demo/widgets/LifecycleWatcher.dart';
import 'package:flutter_demo/widgets/MainTestPage.dart';
import 'package:flutter_demo/widgets/PlatformChannel.dart';
import 'package:flutter_demo/widgets/SampleApp.dart';
import 'package:flutter_demo/widgets/SampleApp2.dart';
import 'package:flutter_demo/widgets/SampleApp3.dart';
import 'package:flutter_demo/widgets/SettingDemo.dart';
import 'package:flutter_demo/widgets/SimpleWidgets.dart';
import 'package:flutter_demo/widgets/TouchMoveView.dart';
import 'package:flutter_demo/widgets/TouchMoveView2.dart';
import 'package:flutter_demo/widgets/WrapDemo.dart';
import 'package:flutter_demo/widgets/ZoomImage.dart';
import 'package:flutter_demo/widgets/cupertino_picker_demo.dart';
import 'package:flutter_demo/widgets/pageViewDemo.dart';
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
  "SliverAppBarDemo": (context) =>  const SliverAppBarDemo(),
  "PageView": (context) =>  const PageViewDemo(),
  "?????????": (context) =>  const CylinderChart(),
  "????????????": (context) =>  const DemoFlowMenu(),
  "??????????????????": (context) => const DemoFlowPopMenu(),
  "???????????????": (context) => const SettingDemo(),
  "FlowDemo": (context) => const FlowDemo(),
  "WrapDemo": (context) => const WrapDemo(),
  "IndexedStackDemo": (context) => const IndexedStackDemo(),
  "????????????": (context) => const WidgetDemo(),
  //"InheritedWidget": (context) => const InheritedWidgetDemo(),
  "?????????": (context) => const CupertinoPickerDemo(),
  "????????????": (context) => const ButtonPage(),
  //"3d": (context) => const SimpleWidgets(),
  "???Android????????????": (context) => const PlatformChannel(),
  "????????????-??????????????????": (context) => const PaintDemo(),
  "????????????--??????????????????": (context) => const ZoomImage(key: Key("adfadsfa"),),
  "??????????????????,????????????????????????": (context) => const MainTestPage(),
  "???????????????": (context) => const TouchMoveView2(),
  "????????????": (context) => const LifecycleWatcher(),
  "??????????????????????????????": (context) => const SampleApp3(),
  "?????? UI": (context) => const SampleApp2(),
  "?????? Canvas ???????????????": (context) => const CanvasDemo(),
  "?????? Canvas ???????????????": (context) => const DrawingBoard(),
  "home": (context) => const HomeRoute(),
  "login": (context) => const LoginRoute(),
  "themes": (context) => const ThemeChangeRoute(),
  "language": (context) => const LanguageRoute(),
  "????????????": (context) => const DrawingPageRoute(),
  "??????????????????": (context) => const ParticlePageRoute(),
  "?????? Matrix ?????????": (context) => const DragImgRoute(),
  "Tab_PageTransitionSwitcher": (context) => const HomeTabRoute(),
  "--??????--Tab_Cupertino": (context) => const CupertinoTabRoute(),
  "LoginWidget": (context) => const LoginWidget(),
  "????????????????????????????????????": (context) => const SampleApp(),
  "Widget ??????????????????": (context) => const FadeAppTest(),
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
            //??????????????????????????????????????????
            supportedLocales: const [
              Locale('en', 'US'), // ????????????
              Locale('zh', 'CN'), // ????????????
              //??????Locales
            ],
            localizationsDelegates: const [
              // ?????????????????????
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate()
            ],
            localeResolutionCallback: (_locale, supportedLocales) {
              if (localeModel.getLocale() != null) {
                //?????????????????????????????????????????????
                return localeModel.getLocale();
              } else {
                //????????????
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale = _locale!;
                } else {
                  //?????????????????????????????????????????????????????????????????????????????????
                  locale = const Locale('en', 'US');
                }
                return locale;
              }
            },
            // ???????????????
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
