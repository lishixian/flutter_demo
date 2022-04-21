import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/Git.dart';
import '../common/GmLocalizations.dart';
import '../common/UserModel.dart';
import '../models/repo.dart';
import 'RepoItem.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  static const loadingTag = "##loading##"; //表尾标记
  final _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(), // 构建主页面
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登录，显示登录按钮
      return Center(
        child: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10, left: 80, top: 20),
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffFCB605)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35))),
                ),
                onPressed: () => Navigator.of(context).pushNamed("login"),
                child: Text(
                  GmLocalizations.of(context)?.login ?? "login",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 55.0),
              child: ElevatedButton(
                // color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).pushNamed("login"),
                // textColor: Colors.white,
                child: Text(GmLocalizations.of(context)?.login ?? "login",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        height: 1.2,
                        fontFamily: "Courier",
                        background: Paint()..color = Colors.yellow,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed)),
              ),
            ),
          ),
          ElevatedButton(
            child: Text(GmLocalizations.of(context)?.login ?? "login"),
            onPressed: () => Navigator.of(context).pushNamed("login"),
            style: ButtonStyle(
              //边框
              shape: MaterialStateProperty.all(const StadiumBorder(// 圆角矩形
                  //side: BorderSide(
                  //设置 界面效果
                  //style: BorderStyle.solid,
                  //color: Color(0xffFF7F24),
                  )),
            ),
          ),
          ElevatedButton(
            child: Text(GmLocalizations.of(context)?.login ?? "login"),
            onPressed: () => Navigator.of(context).pushNamed("login"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
              //背景颜色
              foregroundColor: MaterialStateProperty.all(Color(0xff5E6573)),
              //字体颜色
              overlayColor: MaterialStateProperty.all(Color(0xffffffff)),
              // 高亮色
              shadowColor: MaterialStateProperty.all(Color(0xffffffff)),
              //阴影颜色
              elevation: MaterialStateProperty.all(0),
              //阴影值
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12)),
              //字体
              side: MaterialStateProperty.all(
                  const BorderSide(width: 1, color: Color(0xffCAD0DB))),
              //边框
              // shape: MaterialStateProperty.all(const StadiumBorder(// 圆角矩形
              //     //side: BorderSide(
              //     //设置 界面效果
              //     //style: BorderStyle.solid,
              //     //color: Color(0xffFF7F24),
              //     )),

              shape: MaterialStateProperty.all(const CircleBorder(
                  //圆形
                  side: BorderSide(
                //设置 界面效果
                color: Colors.green,
                width: 280.0,
                style: BorderStyle.none,
              ))),
            ),
          ),
          TextFormField(
              decoration: const InputDecoration(
                labelText: "labelText",
                hintText: "hintText",
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.dangerous),
              ),
              // 校验用户名（不能为空）
              validator: (v) {
                return v == null || v.trim().isNotEmpty
                    ? null
                    : "userNameRequired";
              }),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "请输入验证码",
              suffix: Text(
                  "获取验证码",
                  style: TextStyle(color: Colors.blue),
                ),
    //),
              prefixIcon: Icon(Icons.arrow_forward_ios),
              suffixIcon: Icon(Icons.dangerous),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CupertinoTextField(
              textInputAction: TextInputAction.next,
              restorationId: 'email_address_text_field',
              placeholder: "demoTextFieldEmail",
              keyboardType: TextInputType.emailAddress,
              clearButtonMode: OverlayVisibilityMode.editing,
              autocorrect: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CupertinoTextField(
              textInputAction: TextInputAction.next,
              restorationId: 'login_password_text_field',
              placeholder: "rallyLoginPassword",
              clearButtonMode: OverlayVisibilityMode.editing,
              obscureText: true,
              autocorrect: false,
            ),
          ),

        ]),
      );
    } else {
      //已登录，则显示项目列表
      return ListView.separated(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_items[index].name == loadingTag) {
            //不足100条，继续获取数据
            if (hasMore) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          //显示单词列表项
          return RepoItem(_items[index]);
        },
        separatorBuilder: (context, index) => const Divider(height: .0),
      );
    }
  }

  //请求数据
  void _retrieveData() async {
    var data = await Git(context).getRepos(
      queryParameters: {
        'page': page,
        'page_size': 20,
      },
    );
    //如果返回的数据小于指定的条数，则表示没有更多数据，反之则否
    if (data == null) {
      hasMore = false;
    } else {
      hasMore = data.isNotEmpty && data.length % 20 == 0;
    }

    //把请求到的新数据添加到items中
    setState(() {
      _items.insertAll(_items.length - 1, data!);
      page++;
    });
  }
}
