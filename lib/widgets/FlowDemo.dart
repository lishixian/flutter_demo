import 'package:flutter/material.dart';

class FlowDemo extends StatelessWidget {
  const FlowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlowDemo"),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Flow(
            delegate: ADelegate(10, 10),
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.red,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.green,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.blue,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.yellow,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.brown,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.purple,
              ),
            ],
          )),
    );
  }
}

class ADelegate extends FlowDelegate {
  var wSpacing = 0.0;
  var hSpacing = 0.0;

  ADelegate(this.wSpacing, this.hSpacing);

  @override
  void paintChildren(FlowPaintingContext context) {
    var pWidth = context.size.width;
    var x = 0.0;
    var y = 0.0;
    var childWidth = 0.0;
    var childSize = const Size(0, 0);

    for (int i = 0; i < context.childCount; i++) {
      childSize = context.getChildSize(i) ?? const Size(0, 0);
      childWidth = x + childSize.width;
      // 子 view 的宽度要是比父控件的 width 还大就得换行了
      if (childWidth <= pWidth) {
        // 不换行，定位子 view 位置
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        // 然后把 x 坐标偏移量算出来
        x = childWidth + wSpacing;
      } else {
        // 此时换行了，先重置 x 坐标偏移量
        x = 0;
        // 因为要显示在当前行的下一行，就得先把下一行起始 Y 坐标算出来
        y = y + childSize.height + hSpacing;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        // 然后别忘了计算 x 坐标偏移量
        x = childSize.width + wSpacing;
      }
    }
  }

  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
