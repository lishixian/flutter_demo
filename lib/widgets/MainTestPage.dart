import 'dart:ui';

import 'package:flutter/material.dart';

class MainTestPage extends StatefulWidget {
  const MainTestPage({Key? key}) : super(key: key);

  @override
  _MainTestPageState createState() => _MainTestPageState();
}

class _MainTestPageState extends State<MainTestPage> {
  double _tmpScale = 1.0;
  double _scale = 1.0;

  // Size _defaultPictureSize = Size(200, 300);
  double _defaultPictureWidth = 200;
  double _defaultPictureHeight = 315;

  Offset _lastFocalPoint = Offset(0.0, 0.0);
  Offset _deltaPoint = Offset(80, 80);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: GestureDetector(
          onScaleStart: _handleScaleStart,
          onScaleUpdate: _handleScaleUpdate,
          onScaleEnd: _handleScaleEnd,
          child: Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..scale(_scale, _scale)
                  ..translate(_deltaPoint.dx, _deltaPoint.dy),
                origin: Offset(180, 237.5),

                ///dx = 80 + 200 /2   dy = 80 + 315 / 2 ,这样就是中心点了
                child: Image.asset(
                  "imgs/default.jpg",

                // Image.network(
                //   "https://img1.maka.im/materialStore/beijingshejia/tupianbeijinga/9/M_7TNT6NIM/M_7TNT6NIM_v1.jpg",
                  width: _defaultPictureWidth,
                  height: _defaultPictureHeight,
                ),
              ),
              CustomPaint(
                size: Size(double.infinity, double.infinity),
                painter: DrawRectLight(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _tmpScale = _scale;
    _lastFocalPoint = details.focalPoint;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = _tmpScale * details.scale;
      // _defaultPictureWidth = _defaultPictureWidth + details.scale;
      // _defaultPictureHeight = _defaultPictureHeight + details.scale;
      print(details.scale);
      if (details.scale == 1) {
        _deltaPoint += (details.focalPoint - _lastFocalPoint); //偏移量
        _lastFocalPoint = details.focalPoint; //保存最有一个Point
        print('偏移');
      }
    });
  }

  void _handleScaleEnd(ScaleEndDetails details) {}
}

class DrawRectLight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint
      ..style = PaintingStyle.fill
      ..color = Color(0xAA000000);

    ///假设是中心点
    canvas.clipRect(Rect.fromLTRB(80, 80, 280, 395), clipOp: ClipOp.difference);
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
