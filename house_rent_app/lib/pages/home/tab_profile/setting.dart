import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_toast.dart';

import '../../../scoped_model/auth.dart';
import '../../../utils/scoped_model_helper.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: (){
              ScopedModelHelper.getModel<AuthModel>(context).logout();
              CommonToast.showToast('已经退出登陆');
              // 回到之前的页面
              Timer(const Duration(seconds: 1), () {
                Navigator.of(context).pop();
              });
            },
            child: Text('退出登陆'),
          )
        ],
      ),
    );
  }
}
