import 'package:flutter/material.dart';

class LoginWidget02 extends StatefulWidget {
  const LoginWidget02({Key? key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginWidget02> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  //final RestorableBool _obscureText = RestorableBool(true);
  bool restorableBool = true;
  bool pwdShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              const Text('欢迎', textScaleFactor: 2.0),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: "labelText",
                    hintText: "hintText",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.dangerous),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v == null || v.trim().isNotEmpty
                        ? null
                        : "userNameRequired";
                  }),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "请输入验证码",
                  suffix: Text(
                    "获取验证码",
                    style: TextStyle(color: Colors.blue),
                  ),
                  //),
                  prefixIcon: Icon(Icons.arrow_forward_ios),
                  suffixIcon: Icon(Icons.dangerous),
                ),
              ),
              TextFormField(
                //key: widget.fieldKey,
                restorationId: 'password_text_field',
                obscureText: restorableBool,
                maxLength: 8,
                //onSaved: widget.onSaved,
                //validator: widget.validator,
                //onFieldSubmitted: widget.onFieldSubmitted,
                decoration: InputDecoration(
                  filled: true,
                  hintText: " widget.hintText",
                  labelText: "widget.labelText",
                  helperText: "widget.helperText",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        restorableBool = !restorableBool;
                      });
                    },
                    hoverColor: Colors.transparent,
                    icon: Icon(
                      restorableBool
                          ? Icons.visibility
                          : Icons.visibility_off,
                      semanticLabel: restorableBool
                          ? "demoTextFieldShowPasswordLabel"
                          : "demoTextFieldHidePasswordLabel",
                    ),
                  ),
                ),
              ),
              TextFormField(
                  //autofocus: _nameAutoFocus,
                  //controller: _unameController,
                  decoration: const InputDecoration(
                    labelText: "userName",
                    hintText: "userName",
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v == null || v.trim().isNotEmpty
                        ? null
                        : "userNameRequired";
                  }),
              TextFormField(
                //controller: _pwdController,
                //autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: "password",
                    hintText: "password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v == null || v.trim().isNotEmpty
                      ? null
                      : "passwordRequired";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 55.0),
                  child: const ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    onPressed: null,
                    // textColor: Colors.white,
                    child: Text("login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
