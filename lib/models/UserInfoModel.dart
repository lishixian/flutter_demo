
import 'package:flutter/cupertino.dart';

import '../data/UserInfo.dart';

class UserInfoModel extends ChangeNotifier {
  UserInfoModel(this._userInfo);

  UserInfo _userInfo;

  UserInfo get userInfo => _userInfo;

  void update(UserInfo userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}