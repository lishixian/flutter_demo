import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({Key? key}) : super(key: key);

  @override
  State<WidgetDemo> createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  Object? _radioGroupValue = '英语';

//AbsorbPointer本身可以接收点击事件，消耗掉事件，而IgnorePointer无法接收点击事件，其下的控件可以接收到点击事件（不是子控件）。
  _showAboutDialog() {
    return Row(
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
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          ),
          onPressed: () {
            //print('普通按钮');
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
          },
        ),
      ],
    );
  }

  _showRadioListTiles() {
    return Row(
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
        subtitle: const Text('subtitle'),
        secondary: const Icon(Icons.person),
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

  _showSliderTheme() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: const Color(0xff404080),
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

  RangeValues _rangeValues = const RangeValues(0, 25);

  _showRangeSlider() {
    return RangeSlider(
      values: _rangeValues,
      labels: RangeLabels('${_rangeValues.start}', '${_rangeValues.end}'),
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

  _buildSwitch() {
    return SwitchListTile(
      title: const Text('是否允许4G下载'),
      value: _switchValue,
      activeColor: Colors.red,
      activeTrackColor: Colors.blue,
      inactiveThumbColor: Colors.black54,
      inactiveTrackColor: Colors.yellow,
      // activeThumbImage: AssetImage('images/001.jpg',),
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
    );
  }

  _buildLinearProgressIndicator() {
    return const LinearProgressIndicator(
      value: 0.3,
      backgroundColor: Colors.greenAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }

  _buildCircularProgressIndicator() {
    return const Center(
        child: CircularProgressIndicator(
      value: 0.3,
      backgroundColor: Colors.greenAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
    ));
  }

  _buildCupertinoActivityIndicator() {
    return const CupertinoActivityIndicator(
      radius: 10,
    );
  }

  ButtonStatus _buttonStatus = ButtonStatus.none;

  _buildButtonCaseState() {
    return Center(
        child: MaterialButton(
      color: Colors.blue,
      minWidth: 240,
      height: 48,
      onPressed: () {
        setState(() {
          _buttonStatus = ButtonStatus.loading;
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              _buttonStatus = ButtonStatus.done;
            });
          });
        });
      },
      child: _buildButtonStatusChild(),
    ));
  }

  _buildButtonStatusChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return const Text(
        '登 录',
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return const CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return const Icon(
        Icons.check,
        color: Colors.white,
      );
    }
  }

  _buildDatePickerDefault() {
    return ElevatedButton(
        child: const Text('弹出日期组件-默认'),
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
          );
        });
  }

  _buildDatePickerInput() {
    return ElevatedButton(
        child: const Text('弹出日期组件-input'),
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
            initialEntryMode: DatePickerEntryMode.input,
          );
        });
  }

  _buildDatePickerInputYear() {
    return ElevatedButton(
        child: const Text('弹出日期组件-year'),
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
            //initialEntryMode: DatePickerEntryMode.input,
            initialDatePickerMode: DatePickerMode.year,
            // helpText: '选则日期',
            // cancelText: '取消',
            // confirmText: '确定',
          );
        });
  }

  _buildCalendarDatePicker() {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      onDateChanged: (d) {
        print('$d');
      },
    );
  }

  _showDateRangePicker() {
    return ElevatedButton(
      child: Text('范围日期'),
      onPressed: () async {
        var date = showDateRangePicker(context: context, firstDate: DateTime(2010), lastDate: DateTime(2025));
        print("--_showDateRangePicker--$date");
      },
    );
  }

  _showTimePicker(){
    return ElevatedButton(
      child: Text('弹出时间选择器'),
      onPressed: () async {
        var result =
        showTimePicker(context: context, initialTime: TimeOfDay.now());
      },
    );
  }

  _showPopupMenuButton(){
    return PopupMenuButton<String>(
      offset: const Offset(0,100),
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: '语文',
            child: Text('语文'),
          ),
          const PopupMenuItem<String>(
            value: '数学',
            child: Text('数学'),
          ),
        ];
      },
    );
  }

  _showAlertDialog(){
    return ElevatedButton(
      child: const Text('切换'),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('提示'),
                content: const Text('确认删除吗？'),
                actions: <Widget>[
                  TextButton(child: const Text('取消'),onPressed: (){},),
                  TextButton(child: const Text('确认'),onPressed: (){
                    Navigator.of(context).pop();
                  },),
                ],
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('多种控件'),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 30),
          _showAlertDialog(),
          _showPopupMenuButton(),
          _showTimePicker(),
          _showDateRangePicker(),
          //_buildCalendarDatePicker(),
          _buildDatePickerInputYear(),
          _buildDatePickerInput(),
          _buildDatePickerDefault(),
          _buildButtonCaseState(),
          _buildCupertinoActivityIndicator(),
          _buildCircularProgressIndicator(),
          _buildLinearProgressIndicator(),
          _buildSwitch(),
          _showRangeSlider(),
          Text('值：$_sliderValue'),
          _showSliderTheme(),
          _buildCheckboxListTile(),
          _buildCheckbox(),
          _showAboutDialog(),
          _showRadioListTiles(),
        ],
      ),
    );
  }
}

enum ButtonStatus { none, loading, done }
