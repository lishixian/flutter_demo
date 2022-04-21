import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class DragImgRoute extends StatefulWidget {
  const DragImgRoute({Key? key}) : super(key: key);

  @override
  _DragImgRouteState createState() => _DragImgRouteState();
}

class _DragImgRouteState extends State<DragImgRoute> {

  Matrix4 transform = Matrix4.diagonal3Values(1, 1, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DragImgRoute"),
      ),
      body: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          setState(() {
            transform = m;
          });
        },
        child: Transform(
            transform: transform,
            child:  Image.asset(
              "imgs/default.jpg",
              fit: BoxFit.fitWidth,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            )
        ),
      ),
    );
  }
}
