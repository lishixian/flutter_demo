import 'package:flutter/material.dart';

class IndexedStackDemo extends StatefulWidget {
  const IndexedStackDemo({Key? key}) : super(key: key);

  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("IndexedStackDemo"),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                _buildIndexedStack(),
                const SizedBox(
                  height: 30,
                ),
                _buildRow(),
              ],
            )));
  }

  _buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: <Widget>[
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Icon(
              Icons.fastfood,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Icon(
              Icons.cake,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Icon(
              Icons.local_cafe,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.fastfood),
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.cake),
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.local_cafe),
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
        ),
      ],
    );
  }
}
