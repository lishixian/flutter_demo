import 'package:flutter/material.dart';
import 'dart:math';

class TouchMoveView extends StatefulWidget {
  const TouchMoveView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TouchMoveState();
  }
}

class TouchMoveState extends State<TouchMoveView> {
  late TouchMovePainter painter;
  //静止状态下的offset
  Offset idleOffset=Offset(0, 0);
  //本次移动的offset
  Offset moveOffset=Offset(0, 0);
  //最后一次down事件的offset
  Offset lastStartOffset=Offset(0, 0);

  @override
  void initState() {
    painter = TouchMovePainter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: moveOffset,
        child: Container(
          height: 50,
          width: 50,
          child: GestureDetector(
            onPanStart: (detail) {
              setState(() {
                lastStartOffset=detail.globalPosition;
                painter.painterColor = Colors.green;
              });
            },
            onPanUpdate: (detail){
              setState(() {
                moveOffset=detail.globalPosition-lastStartOffset+idleOffset;
              });
            },

            onPanEnd: (detail) {
              setState(() {
                painter.painterColor = Colors.red;
                idleOffset=moveOffset;
              });
            },
            child: CustomPaint(
              painter: painter,
            ),
          ),
        ));
  }
}

class TouchMovePainter extends CustomPainter {
  var painter = Paint();
  var painterColor = Colors.red;

  @override
  void paint(Canvas canvas, Size size) {
    print("----TouchMovePainter---");
    painter.color = painterColor;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        min(size.height, size.width) / 8, painter);
  }

  @override
  bool shouldRepaint(TouchMovePainter oldDelegate) {
    return oldDelegate.painterColor!=painterColor;
  }
}

