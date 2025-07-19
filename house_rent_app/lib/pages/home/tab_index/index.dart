import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import '../info/index.dart';
import 'index_recommend.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MySearchBar(
          showLocation: true,
          showMap: true,
          onSearch: (){
            Navigator.of(context).pushNamed("search");
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        CommonSwiper(),
        IndexNavigator(),
        IndexRecommend(),
        Info(showTitle: true,)
      ]),
    );
  }
}
