import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({Key? key}) : super(key: key);

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  Object? _radioGroupValue = '英语';

  _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationIcon: Image.asset(
        'imgs/001.jpg',
        height: 100,
        width: 100,
      ),
      applicationName: 'applicationName-应用程序',
      applicationVersion: 'applicationVersion-1.0.0',
      applicationLegalese: 'applicationLegalese',
      children: <Widget>[
        Container(
          height: 30,
          color: Colors.red,
        ),
        Container(
          height: 30,
          color: Colors.blue,
        ),
        Container(
          height: 30,
          color: Colors.green,
        )
      ],
    );
  }

  _textRadioListTile(String name) {
    return RadioListTile(
      title: Text(
        name,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      value: name,
      groupValue: _radioGroupValue,
      onChanged: (value) {
        setState(() {
          _radioGroupValue = value;
          print('$value--$_radioGroupValue');
        });
      },
    );
  }

  var _checkValue = false;

  _buildCheckbox() {
    return Checkbox(
      value: _checkValue,
      onChanged: (value) {
        setState(() {
          _checkValue = value!;
        });
      },
    );
  }

  _buildCheckboxListTile() {
    return SizedBox(
      width: 300,
      child: CheckboxListTile(
        //controlAffinity: ListTileControlAffinity.leading,
        subtitle: Text('subtitle'),
        secondary: Icon(Icons.person),
        title: const Text('xx'),
        value: _checkValue,
        onChanged: (value) {
          setState(() {
            _checkValue = value!;
          });
        },
      ),
    );
  }

  double _sliderValue = 0;
  _showSliderTheme(){
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xff404080),
          thumbColor: Colors.blue,
          overlayColor: Colors.green,
          valueIndicatorColor: Colors.purpleAccent),
      child: Slider(
        value: _sliderValue,
        label: '$_sliderValue',
        min: 0,
        max: 100,
        divisions: 10,
        onChanged: (v) {
          setState(() {
            _sliderValue = v;
          });
        },
      ),
    );
  }

  RangeValues _rangeValues = RangeValues(0, 25);

  _showRangeSlider(){
    return RangeSlider(
      values: _rangeValues,
      labels: RangeLabels('${_rangeValues.start}','${_rangeValues.end}'),
      min: 0,
      max: 100,
      divisions: 4,
      onChanged: (v) {
        setState(() {
          _rangeValues = v;
        });
      },
    );
  }

  var _switchValue = false;
  _buildSwitch(){
    return SwitchListTile(
      title:Text('是否允许4G下载'),
      value: _switchValue,
      activeColor: Colors.red,
      activeTrackColor: Colors.blue,
      inactiveThumbColor: Colors.black54,
      inactiveTrackColor: Colors.yellow,
     // activeThumbImage: AssetImage('images/001.jpg',),
      onChanged: (value){
        setState(() {
          _switchValue = value;
        });
      },
    );
  }
  _buildLinearProgressIndicator(){
    return const LinearProgressIndicator(
      //value: 0.3,
      backgroundColor: Colors.greenAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }

  _buildCircularProgressIndicator(){
    return const CircularProgressIndicator(
      //value: 0.3,
      backgroundColor: Colors.greenAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }

  _buildCupertinoActivityIndicator(){
    return const CupertinoActivityIndicator(
      radius: 10,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCupertinoActivityIndicator(),
          _buildCircularProgressIndicator(),
          _buildLinearProgressIndicator(),
          _buildSwitch(),
          _showRangeSlider(),
          Text('值：$_sliderValue'),
          _showSliderTheme(),
          _buildCheckboxListTile(),
          _buildCheckbox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text(
                  'AboutDialog',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue,
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                ),
                onPressed: () {
                  //print('普通按钮');
                  _showAboutDialog();
                },
              ),
            ],
          ),
//AbsorbPointer本身可以接收点击事件，消耗掉事件，而IgnorePointer无法接收点击事件，其下的控件可以接收到点击事件（不是子控件）。
//           AbsorbPointer(
//             absorbing: false,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text(
//                     'AboutListTile',
//                     style: TextStyle(fontSize: 24, color: Colors.white),
//                   ),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.blue,
//                     ),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5))),
//                   ),
//                   onPressed: () {
//                     print('普通按钮');
//                     //const AboutListTile(icon: FlutterLogo(),child: Text('AboutListTile'),);
//                   },
//                 ),
//               ],
//             ),
//           ),

          Row(
            children: <Widget>[
              Flexible(
                child: _textRadioListTile('语文'),
              ),
              Flexible(
                child: _textRadioListTile('数学'),
              ),
              Flexible(
                child: _textRadioListTile('英语'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
