import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/room_list_item_widget.dart';

import '../../../widgets/search_bar/index.dart';
import 'data_list.dart';
import 'filter_bar/filter_drawer.dart';
import 'filter_bar/index.dart';


class TabSearch extends StatefulWidget {

  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar:AppBar(
        actions: [Container()],
        elevation: 0,
        title: MySearchBar(
          showLocation: true,
          showMap: true,
          onSearch: (){
            Navigator.of(context).pushNamed("search");
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 41,
            child: FilterBar(onChange:(data){}),
          ),
          Expanded(
            child: ListView(
              children: dataList.map((e) => RoomListItemWidget(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
