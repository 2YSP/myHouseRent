import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/utils/string_util.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user_info.dart';
import '../utils/dio_http.dart';
import '../utils/store.dart';

class AuthModel extends Model{

  String _token = '';

  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  String get token => _token;

  bool get isLogin => !isEmpty(_token);

  void initApp(BuildContext context) async{
    Store store = await  Store.getInstance();
    String token = await store.getString(StoreKeys.TOKEN);
    if(!isEmpty(token)){
      login(token, context);
    }
  }

  /// 登录
  Future<void> login(String token,BuildContext context) async {
    _token = token;
    _userInfo = await _getUserInfo(context);
    notifyListeners();
  }

  /// 登出
  void logout() {
    _token = '';
    _userInfo = null;
    notifyListeners();
  }


  Future<UserInfo> _getUserInfo(BuildContext context) async{
    String path = '/user';
    var resp = await DioHttp.of(context).get(path, null,_token);
    var dataMap = json.decode(resp.toString());
    var userInfo = UserInfo.fromJson(dataMap['data']);
    // _userInfo = userInfo;
    return Future.value(userInfo);
  }

}