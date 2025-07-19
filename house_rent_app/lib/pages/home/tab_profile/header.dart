import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import '../../../scoped_model/auth.dart';

var loginRegisterStyle = TextStyle(fontSize: 20,color: Colors.white);

class Header extends StatelessWidget {

  const Header({super.key});


  Widget _notLoginBuilder(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 10.0,left: 20,bottom: 20.0),
      height: 95,
      decoration: BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(backgroundImage: NetworkImage("https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg")),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.0)),
              Row(children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed('login');
                  },
                  child: Text("登陆",style: loginRegisterStyle),
                ),
                Text("/",style: loginRegisterStyle),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed('register');
                  },
                  child: Text("注册",style: loginRegisterStyle),
                )
              ],),
              Text("登陆后可以体验更多",style: TextStyle(color: Colors.white),)
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context){
    var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;
    // print(userInfo);
    var userName = userInfo?.nickname ?? 'Ship';
    var userImage = userInfo?.avatar ?? 'https://tva1.sinaimg.cn/large/008i3skNgy1gsuhtensa6j30lk0li76f.jpg';
    if(!userImage.contains('http')){
      userImage = Config.BaseUrl + userImage;
    }
    return Container(
      padding: EdgeInsets.only(top: 10.0,left: 20,bottom: 20.0),
      height: 95,
      decoration: BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(backgroundImage: NetworkImage(userImage)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.0)),
              Text(userName,style: loginRegisterStyle),
              Text("查看编辑个人资料",style: TextStyle(color: Colors.white),)
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var token = ScopedModelHelper.getModel<AuthModel>(context).token;
    var isLogin = token != null && token != '';
    // print(isLogin);
    return isLogin ? _loginBuilder(context) :_notLoginBuilder(context);
  }
}
