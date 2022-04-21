import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SampleApp3 extends StatelessWidget {
  const SampleApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key? key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody() {
    bool showLoadingDialog = widgets.isEmpty;
    if (showLoadingDialog) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  Widget getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: getBody(),
    );
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  Future<void> loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends its SendPort as the first message.
    SendPort dataLoaderReceivePortSendPort = await receivePort.first;
    print("--loadData--002-- dataLoaderReceivePortSendPort");


    List msg = await sendReceive(
      dataLoaderReceivePortSendPort,
      'https://jsonplaceholder.typicode.com/posts',
    );

    setState(() {
      print("----loadData--006----setState");
      widgets = msg;
    });
  }

  // The entry point for the isolate.
  static Future<void> dataLoader(SendPort loadDataSendPort) async {

    // Open the ReceivePort for incoming messages.
    ReceivePort port = ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    print("--dataLoader--001-- loadDataSendPort.send(port.sendPort)");
    loadDataSendPort.send(port.sendPort);


    await for (var msg in port) {

      String data = msg[0];//  'https://jsonplaceholder.typicode.com/posts'
      SendPort sendReceive_ReceivePort_sendPort = msg[1];// sendReceive_ReceivePort_sendPort

      print("----dataLoader--004---- http.get");
      http.Response response = await http.get(Uri.parse(data));
      // Lots of JSON to parse
      print("----dataLoader--005----  sendReceive_ReceivePort_sendPort.send");
      sendReceive_ReceivePort_sendPort.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort dataLoaderReceivePortSendPort, msg) {
    ReceivePort response = ReceivePort();
    print("--sendReceive---003--dataLoaderReceivePortSendPort.send");
    dataLoaderReceivePortSendPort.send([msg, response.sendPort]);
    return response.first;//jsonDecode(response.body)
  }
}
