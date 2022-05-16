import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SettingDemo"),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
            child: Wrap(
              //direction:Axis.vertical,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.start,
              //crossAxisAlignment:WrapCrossAlignment.start,
              spacing: 5,
              runSpacing: 3,
              children: List.generate(10, (i) {
                double w = 50.0 + 10 * i;
                double h = 50.0 + 5 * i;
                return Container(
                  color: Colors.primaries[i],
                  height: h,
                  alignment: Alignment.center,
                  width: w,
                  child: Text('$i'),
                );
              }),
            )));
  }
}
