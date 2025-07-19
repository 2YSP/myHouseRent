import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/string_util.dart';
import 'package:hook_up_rent/utils/common_toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var rePassword = rePasswordController.text;
    if (isEmpty(username) || isEmpty(password)) {
      // print('用户名或密码不能为空!');
      CommonToast.showToast('用户名或密码不能为空!');
      return;
    }
    if (password != rePassword) {
      // print('两次输入的密码不一致!');
      CommonToast.showToast('两次输入的密码不一致!');
      return;
    }
    var path = '/user/register';
    var params = {'username': username, 'password': password};
    var resp = await DioHttp.of(context).post(path, params);
    var respJsonStr = json.decode(resp.toString());
    print(respJsonStr);
    if(respJsonStr['code'] == 200){
      // print('注册成功');
      CommonToast.showToast('注册成功');
      // 跳转到登录页
      Timer(Duration(seconds: 1),(){
        Navigator.of(context).pushReplacementNamed(Routes.login);
      });

    }else{
      var errorMsg = isEmpty(respJsonStr['msg']) ? '注册失败' : respJsonStr['msg'];
      CommonToast.showToast(errorMsg);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.person)),
            ),
            const Padding(padding: EdgeInsets.all(10)), // Padding
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true),
            const Padding(padding: EdgeInsets.all(10)), // Padding
            TextField(
                controller: rePasswordController,
                decoration: InputDecoration(
                  labelText: "确认密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _registerHandler();
                },
                child: const Text("注册")),
            const Padding(padding: EdgeInsets.all(10)), // Padding
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("已有账号,"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    child: const Text("去登录~"))
              ],
            )
          ])),
    );
  }
}
