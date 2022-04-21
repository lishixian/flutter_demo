import 'package:flutter/material.dart';
import 'paint_demo.dart';

class Widget2 extends StatefulWidget {
  const Widget2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Widget2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Widget2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black12,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _topView("xxxxx", "666666666");
            } else if (index == 1) {
              return _cell(index, Icons.list, "地图", "地图绘制", true);
            } else if (index == 2) {
              return _cell(
                  index, Icons.card_membership, "card_membership", "", true);
            } else if (index == 3) {
              return _cell(index, Icons.title, "title", "", false);
            } else if (index == 4) {
              return _spaceView();
            } else if (index == 5) {
              return _cell(index, Icons.help, "help", "", true);
            } else if (index == 6) {
              return _cell(index, Icons.settings, "settings", "", false);
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white60,
              );
            }
          },
          itemCount: 7,
        ),
      ),
    );
  }

  Widget _spaceView() {
    return Container(
      height: 10.0,
      color: Colors.black12,
    );
  }

  Widget _cell(int row, IconData iconData, String title, String describe,
      bool isShowBottomLine) {
    return GestureDetector(
      onTap: () {
        switch (row) {
          case 0:
            print("$row -- $title");
            break;
          case 1:
            print("$row -- $title");
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PaintDemo(),
            ));
            break;
          case 2:
            print("$row -- $title");
            break;
          case 3:
            print("$row -- $title");
            break;
          case 4:
            print("$row -- $title");
            break;
          case 5:
            print("$row -- $title");
            break;
          case 6:
            print("$row -- $title");
            break;
        }
      },
      child: Container(
        color: Colors.white,
        height: 50.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(0.0),
                height: (isShowBottomLine ? 49.0 : 50.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(iconData, color: Colors.black),
                            Container(
                              margin: const EdgeInsets.only(left: 15.0),
                              child: Text(title,
                                  style: const TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(describe,
                              style: const TextStyle(
                                  color: Color(0xFFD5A670), fontSize: 14.0)),
                          const Icon(Icons.keyboard_arrow_right,
                              color: Color(0xFF777777)),
                        ],
                      ),
                    ])),
            _bottomLine(isShowBottomLine),
          ],
        ),
      ),
    );
  }

  Widget _bottomLine(bool isShowBottomLine) {
    if (isShowBottomLine) {
      return Container(
          margin: const EdgeInsets.all(0.0),
          child: const Divider(height: 1.0, color: Colors.grey),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0));
    }
    return Container();
  }

  Widget _topView(String name, String phone) {
    return GestureDetector(
      onTap: () {
        print("_topView");
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 60, bottom: 10),
                child: const Text('我的', textScaleFactor: 1.8),
              ),
              onTap: null,
            ),
            Container(
              height: 90.0,
              margin: const EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(35.0))),
                        child: Image.asset("images/default.jpg",
                            height: 70.0, width: 70.0),
                      )),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text("ssssss",
                            style: TextStyle(
                                color: Color(0xFF777777), fontSize: 18.0),
                            textAlign: TextAlign.left),
                        Text("xxxxx",
                            style: TextStyle(
                                color: Color(0xFF555555), fontSize: 12.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  ),
                  Container(
                    child: const Icon(Icons.keyboard_arrow_right,
                        color: Color(0xFF777777)),
                    margin: const EdgeInsets.only(right: 10),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
