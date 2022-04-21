import 'package:flutter/material.dart';
import 'dart:math';

class TouchMoveView2 extends StatefulWidget {
  const TouchMoveView2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TouchMoveState();
  }
}

class TouchMoveState extends State<TouchMoveView2> {
  //静止状态下的offset
  Offset idleOffset = Offset(0, 0);
  //本次移动的offset
  Offset moveOffset = Offset(0, 0);
  //最后一次down事件的offset
  Offset lastStartOffset = Offset(0, 0);

  Paint painter = Paint()
    ..strokeWidth = 1
    ..color = Colors.red
    ..isAntiAlias = false;

  @override
  void initState() {
    super.initState();
    print("--initState--");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        child: GestureDetector(
          onPanStart: (detail) {
            setState(() {
              lastStartOffset = detail.globalPosition;
              painter.color = Colors.green;
              print("----onPanStart---");
            });
          },
          onPanUpdate: (detail) {
            setState(() {
              moveOffset = detail.globalPosition - lastStartOffset + idleOffset;
              print("----onPanUpdate---");
            });
          },
          onPanEnd: (detail) {
            setState(() {
              painter.color = Colors.red;
              idleOffset = moveOffset;
              print("----onPanEnd---");
            });
          },
          child: CustomPaint(
            painter: TouchMovePainter(painter: painter, moveOffset: moveOffset),
          ),
        ));
  }
}

class TouchMovePainter extends CustomPainter {
  Paint painter;
  Offset moveOffset;

  TouchMovePainter({ required this.painter, required this.moveOffset});

  @override
  void paint(Canvas canvas, Size size) {
    print("----TouchMovePainter---");
    canvas.drawCircle(
        Offset(size.width / 2 + moveOffset.dx, size.height / 2 + moveOffset.dy),
        min(size.height, size.width) / 8,
        painter);
  }

  @override
  bool shouldRepaint(TouchMovePainter oldDelegate) {
    print("----shouldRepaint---");
    return oldDelegate.moveOffset != moveOffset || oldDelegate.painter != painter;
    //return true;
  }
}
