import 'package:flutter/material.dart';

class DrawingPageRoute extends StatelessWidget {
  const DrawingPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DrawingPageRoute"),
        ),
        body: CustomPaint(
          painter: CurvePainter(),
          child: const Center(
            // child: Text(
            //   "Blade Runner jjjj",
            //   style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            // ),
          ),
        ));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height2 = size.height / 2;
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;

    canvas.drawLine(
      Offset(0, size.height - 100),
      Offset(size.width, height2 - 50),
      paint,
    );

    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, height2), size.width / 4, paint);

    paint.color = Colors.green;
    var path = Path();
    path.moveTo(size.width / 4 + 40, height2);
    path.lineTo(size.width / 2, height2 + 50);
    path.lineTo(size.width * 3 / 4 - 30, height2 - 50);
    //path.close();
    //paint.style = PaintingStyle.fill;
    //canvas.drawPath(path, paint);

    //Rect oval = Rect.fromPoints(const Offset(80, 80), const Offset(300, 180));
    //path.addArc(oval, 0, 3);

    //path.moveTo(size.width / 2, 200);
// 权重=0
    //path.conicTo(80, 280, 300, 380, 0);
// 权重=1
    //path.conicTo(80, 280, 300, 380, 1);
// 权重=2
    //path.conicTo(0, size.height - 100, size.width, height2 - 50, 0.3);

    canvas.drawPath(path, paint);

    paint.color = Colors.black45;
    paint.strokeWidth = 2;
    var paths = Path();
    List<Offset> points = [];
    double dx = 30;
    double dy = 30;
    double xx = 30;
    points.add(Offset(dx, dy));

    for (int i = 0; i < 50; i++) {
      dx += xx;
      if (dx >= size.width) {
        dx = size.width;
        xx = -30;
        dy += 30;
      } else if (dx <= 0) {
        dx = 0;
        xx = 30;
        dy += 30;
      }
      points.add(Offset(dx, dy));
    }
    paths.addPolygon(points, false);
    canvas.drawPath(paths, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}