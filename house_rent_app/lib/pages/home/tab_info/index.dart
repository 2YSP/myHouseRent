import 'package:flutter/material.dart';

import '../../../widgets/search_bar/index.dart';
import '../info/index.dart';


class TabInfo extends StatefulWidget {


  const TabInfo({super.key});

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MySearchBar(
          onSearch: (){
            Navigator.of(context).pushNamed("search");
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
         Info(),
         Info(),
         Info()
        ],
      ),
    );
  }
}
