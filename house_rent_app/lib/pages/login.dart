import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/dio_http.dart';

import '../routes.dart';
import '../utils/scoped_model_helper.dart';
import '../utils/store.dart';
import '../utils/string_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassWord = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    if (isEmpty(username) || isEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空！');
      return;
    }
    // 调用登录接口
    String path = '/user/login';
    var params = {'username': username, 'password': password};
    var resp = await DioHttp.of(context).post(path, params);

    var respMap = json.decode(resp.toString());
    if (respMap['code'] != 200) {
      var errorMsg = isEmpty(respMap['msg']) ? '登录失败' : respMap['msg'];
      CommonToast.showToast(errorMsg);
      return;
    }
    CommonToast.showToast('登录成功');
    String token = respMap['data']['token'];
    // 保存token
    Store store = await Store.getInstance();
    await store.setString(StoreKeys.TOKEN, token);
    ScopedModelHelper.getModel<AuthModel>(context).login(token, context);
    // 回到之前的页面
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: SafeArea(
          minimum: EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "请输入用户名",
                    prefixIcon: Icon(Icons.person))),
            const Padding(padding: EdgeInsets.all(10)), // Padding
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(_showPassWord
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _showPassWord = !_showPassWord;
                          });
                        })),
                obscureText: !_showPassWord),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  // todo 登录
                  _loginHandler();
                },
                child: const Text("登录")),
            const Padding(padding: EdgeInsets.all(10)), // Padding
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("还没注册,"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.register);
                    },
                    child: const Text("去注册~"))
              ],
            )
          ])),
    );
  }
}
