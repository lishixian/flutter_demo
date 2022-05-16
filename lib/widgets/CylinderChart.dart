import 'package:flutter/material.dart';

class CylinderChart extends StatefulWidget {
  const CylinderChart({Key? key}) : super(key: key);

  @override
  _CylinderChartState createState() => _CylinderChartState();
}

class _CylinderChartState extends State<CylinderChart> {
  final double _width = 20.0;
  List<double> _heightList = [60.0, 80.0, 100.0, 120.0, 140.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("柱状图"),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Center(
              child: SizedBox(
                height: 200,
                width: 250,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        left: 5,
                        right: 5,
                        child: _Axis(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:
                                  List.generate(_heightList.length, (index) {
                                return _Cylinder(
                                  height: _heightList[index],
                                  width: _width,
                                  color: Colors.primaries[
                                      index % Colors.primaries.length],
                                );
                              })),
                        )),
                    Positioned(
                      top: 0,
                      left: 30,
                      child: OutlinedButton(
                        child: const Text('反转'),
                        onPressed: () {
                          setState(() {
                            _heightList = _heightList.reversed.toList();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class _Axis extends StatelessWidget {
  final Widget child;

  const _Axis({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, width: 2),
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      child: child,
    );
  }
}

class _Cylinder extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const _Cylinder(
      {Key? key,
      required this.height,
      required this.width,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: height,
      width: width,
      color: color,
    );
  }
}
