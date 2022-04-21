
import 'package:flutter/cupertino.dart';

class GmLocalizations {
  GmLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;

  get userName => null;
  //为了使用方便，我们定义一个静态方法
  static GmLocalizations? of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get userNameOrPasswordWrong {
    return isZh ? "用户名称或者密码错误!" : "userNameOrPasswordWrong!";
  }

  String get auto {
    return isZh ? "自动" : "auto";
  }
  String get userNameRequired {
    return isZh ? "需要用户名称" : "userNameRequired";
  }

  String get passwordRequired {
    return isZh ? "需要密码" : "passwordRequired";
  }
  String get home {
    return isZh ? "家" : "home";
  }
  String get title {
    return isZh ? "Flutter 例子" : "Flutter Demo";
  }
  String get login {
    return isZh ? "登录" : "Login";
  }
  String get logout {
    return isZh ? "退出" : "Logout";
  }
  String get password {
    return isZh ? "密码" : "password";
  }
  String get theme {
    return isZh ? "主题" : "theme";
  }
  String get language {
    return isZh ? "语言" : "language";
  }
  String get logoutTip {
    return isZh ? "确认退出" : "logoutTip";
  }
  String get cancel {
    return isZh ? "取消" : "cancel";
  }
  String get yes {
    return isZh ? "是" : "yes";
  }
  String get noDescription {
    return isZh ? "无装饰" : "noDescription";
  }
}