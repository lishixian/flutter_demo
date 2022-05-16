import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasDemo extends StatelessWidget {
  const CanvasDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(body: Signature());
}

class Signature extends StatefulWidget {
  const Signature({Key? key}) : super(key: key);

  @override
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("使用 Canvas 进行绘制点"),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10.0, right: 10.0),
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  RenderBox? referenceBox =
                      context.findRenderObject() as RenderBox;
                  Offset localPosition =
                      referenceBox.globalToLocal(details.localPosition);
                  _points = List.from(_points)..add(localPosition);
                });
              },
              onPanEnd: (DragEndDetails details) {
                //_points.add(null);
              },
              child: CustomPaint(
                painter: SignaturePainter(_points),
                size: Size.infinite,
              ),
            )));
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    print("--paint--length:${points.length}");
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    // for (int i = 0; i < points.length - 1; i++) {
    //   if (points[i] != null && points[i + 1] != null)
    //     canvas.drawLine(points[i]!, points[i + 1]!, paint);
    // }
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
