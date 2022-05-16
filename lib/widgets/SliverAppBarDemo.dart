import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('SliverAppBarDemo'),
            background: Image.asset(
              'imgs/001.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 80.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[(index % 18)],
                  child: Text('$index'),
                ),
              );
            },
          ),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((content, index) {
        //     return  Card(
        //                child: Container(
        //       height: 65,
        //       color: Colors.primaries[index % Colors.primaries.length],
        //       child: Text('$index'),
        //     ));
        //   }, childCount: 10),
        // ),
      ],
    );
  }
}
