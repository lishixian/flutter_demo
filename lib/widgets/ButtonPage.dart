import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('按钮页面'),
            actions:<Widget>[
              IconButton(
                icon:Icon(Icons.search),
                onPressed: (){
                  print("图标按钮");
                },
              )
            ]
        ),

        // 浮动按钮
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add,color:Colors.blue,size:40,),
          // 点击事件
          onPressed: (){
            print('浮动按钮');
          },
          // 背景颜色
          backgroundColor: Colors.yellow,
        ),
        // 浮动按钮的位置
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child:Text('普通按钮'),
                  // 背景颜色
                  color:Colors.blue,
                  // 文字颜色
                  textColor: Colors.white,
                  // 按钮阴影
                  elevation: 10,
                  onPressed: (){
                    print('普通按钮');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton.icon(
                  icon: Icon(Icons.search),
                  label: Text('图标按钮'),
                  onPressed: (){
                    print('图标按钮');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 通过加外层容器设定尺寸来控制按钮的大小
                Container(
                  width: 140,
                  height:50,
                  child: RaisedButton(
                    child:Text('设置宽高'),
                    // 背景颜色
                    color:Colors.blue,
                    // 文字颜色
                    textColor: Colors.white,
                    // 按钮阴影
                    elevation: 10,
                    onPressed: (){
                      print('设置宽高');
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 让按钮宽度自适应
                Expanded(
                  // 通过加外层容器设定尺寸来控制按钮的大小
                    child:Container(
                      height:80,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        child:Text('自适应按钮'),
                        // 背景颜色
                        color:Colors.blue,
                        // 文字颜色
                        textColor: Colors.white,
                        // 按钮阴影
                        elevation: 10,
                        onPressed: (){
                          print('自适应按钮');
                        },
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child:Text('圆角按钮'),
                  // 背景颜色
                  color:Colors.blue,
                  // 文字颜色
                  textColor: Colors.white,
                  // 按钮阴影
                  elevation: 10,
                  // 圆角
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    print('圆角按钮');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 80,
                  child: RaisedButton(
                    child:Text('圆形按钮'),
                    // 背景颜色
                    color:Colors.blue,
                    // 文字颜色
                    textColor: Colors.white,
                    // 按钮阴影
                    elevation: 10,
                    // 圆角
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                    // 水波纹
                    splashColor:Colors.red,
                    onPressed: (){
                      print('圆形按钮');
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('扁平按钮'),
                  color:Colors.blue,
                  textColor: Colors.yellow,
                  onPressed:(){
                    print('扁平按钮');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  child: Text('边框按钮'),
                  textColor: Colors.yellow,
                  onPressed:(){
                    print('边框按钮');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonBar(
                    children:<Widget>[
                      RaisedButton(
                          child:Text('按钮组'),
                          color:Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          onPressed: (){
                            print('按钮组');
                          }
                      ),
                      RaisedButton(
                          child:Text('按钮组'),
                          color:Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          onPressed: (){
                            print('按钮组');
                          }
                      ),
                      RaisedButton(
                          child:Text('按钮组'),
                          color:Colors.blue,
                          textColor: Colors.white,
                          elevation: 20,
                          onPressed: (){
                            print('按钮组');
                          }
                      )
                    ]
                )
              ],
            ),
            MyButton(text:'自定义按钮',width:60.0,height:40.0,pressed:(){
              print('自定义按钮');
            })
          ],
        )
    );
  }
}

// 自定义按钮
class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;

  const MyButton({this.text='',this.width=80.0,this.height=30.0,this.pressed=0});

  @override
  Widget build(BuildContext context){
    return Container(
        width:this.width,
        height:this.height,
        child: RaisedButton(
            child: Text(this.text),
            onPressed:this.pressed
        )
    );
  }
}
