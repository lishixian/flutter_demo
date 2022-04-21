import 'package:flutter/material.dart';

import 'LoginWidget.dart';
import 'login.dart';

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35))),
                  ),
                  onPressed: () =>
                  //Navigator.of(context).pushNamed("LoginWidget"),
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LoginWidget02()
                  )),
                  child: const Text(
                    "登录",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 100),
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35))),
                  ),
                  onPressed: () =>
                  //Navigator.of(context).pushNamed("login_widget"),
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LoginWidget()
                  )),
                  child: const Text(
                    "新用户注册",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

