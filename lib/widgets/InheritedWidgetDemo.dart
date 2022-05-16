import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/UserInfo.dart';
import '../models/UserInfoModel.dart';

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({Key? key}) : super(key: key);

  @override
  _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  //UserInfo _userInfo = UserInfo(name: '老孟', age: 18);
  int _clickCount =0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserInfoModel(UserInfo(name: '老孟', age: 18))),
        //ChangeNotifierProvider.value(value:UserInfoModel(UserInfo(name: '老孟', age: 18))),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('InheritedWidget Demo'),
          ),
          body: Center(
            child: A(
              child: F(),
            ),
          ),
          floatingActionButton: Consumer<UserInfoModel>(
            builder: (ctx, userInfoModel, child) {
              return FloatingActionButton(
                child: child,
                onPressed: () {
                  userInfoModel.update(UserInfo(name: '老孟${_clickCount++}', age: 18));
                },
              );
            },
          ),
        );
      },
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  late ValueNotifier<UserInfo> _valueNotifier;

  ValueNotifier<UserInfo> get valueNotifier => _valueNotifier;

  MyInheritedWidget(UserInfo userInfo, {Key? key, required Widget child}) : super(key: key, child: child) {
    _valueNotifier = ValueNotifier<UserInfo>(userInfo);
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.getElementForInheritedWidgetOfExactType<MyInheritedWidget>()?.widget as MyInheritedWidget;
  }

  void updateData(UserInfo info) {
    _valueNotifier.value = info;
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return false;
  }
}

class F extends StatefulWidget {
  @override
  _FState createState() => _FState();
}

class _FState extends State<F> {
  @override
  void initState() {
    super.initState();
    print('F initState');
  }

  @override
  Widget build(BuildContext context) {
    print('F build');
    //return Text('name:${MyInheritedWidget.of(context)?.userInfo.name}');
    return ValueListenableBuilder(
      builder: (context, UserInfo value, child) {
        return Text(value.name);
      },
      valueListenable: MyInheritedWidget.of(context).valueNotifier,
        //valueListenable:Provider.of<UserInfoModel>(context).userInfo,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('F didChangeDependencies');
  }

  @override
  void dispose() {
    super.dispose();
    print('F dispose');
  }
}

class A extends StatefulWidget {
  final Widget child;

  const A({Key? key, required this.child}) : super(key: key);

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  @override
  void initState() {
    super.initState();
    print('A initState');
  }

  @override
  Widget build(BuildContext context) {
    print('A build');
    return Center(
      child: widget.child,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('A didChangeDependencies');
  }

  @override
  void dispose() {
    super.dispose();
    print('A dispose');
  }
}
