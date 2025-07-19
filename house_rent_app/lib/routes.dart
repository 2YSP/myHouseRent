import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/home/room_add/index.dart';
import 'package:hook_up_rent/pages/home/room_manage/index.dart';
import 'package:hook_up_rent/pages/home/tab_profile/setting.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/not_found.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/pages/room_detail/index.dart';


class Routes{

  // 定义路由名称
  static String home = "/";
  // 登录
  static String login = "/login";
  // 注册
  static String register = "/register";

  static String roomDetail = "/roomDetail/:roomId";

  static String setting = "/setting";

  static String roomManage = "/roomManage";

  static String roomAdd = "/roomAdd";

  // 定义路由处理函数
  static final Handler _homeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return HomePage();
  });

  static final Handler _loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return const LoginPage();
  });

  static final Handler _notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return const NotFoundPage();
  });

  static final Handler _roomDetailHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return RoomDetailPage(roomId: parameters['roomId']![0]);
  });

  static final Handler _registerHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return const RegisterPage();
  });

  static final Handler _settingHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return const SettingPage();
  });

  static final Handler _roomManageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return const RoomManagePage();
  });

  static final Handler _roomAddHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
    return const RoomAddPage();
  });



  // 关联路由名称和函数
  static void configureRoutes(FluroRouter router){
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.notFoundHandler = _notFoundHandler;
  }

}