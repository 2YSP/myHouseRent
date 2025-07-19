import 'package:flutter/material.dart';

import '../info/index.dart';
import 'advertisement.dart';
import 'function_button.dart';
import 'header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        elevation: 0,
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed("setting");
        }, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        children: [
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(showTitle: true)
        ],
      ),
    );
  }
}
