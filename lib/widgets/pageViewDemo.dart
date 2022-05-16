import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  List<String> pageList = ['PageView1', 'PageView2', 'PageView3'];
  int _currentPageIndex = 0;

  _buildPageView() {
    return Center(
      child: SizedBox(
        height: 230,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index % (pageList.length);
                });
              },
              itemCount: 10000,
              itemBuilder: (context, index) {
                return _buildPageViewItem(pageList[index % (pageList.length)]);
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pageList.length, (i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPageIndex == i
                            ? Colors.blue
                            : Colors.grey),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageViewItem(String txt, {Color color = Colors.red}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: const TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PageDemo"),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: _buildPageView(),
        ));
  }
}
