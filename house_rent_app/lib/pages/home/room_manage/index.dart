import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';

import '../../../widgets/common_floating_action_button.dart';
import '../../../widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CommonFloatingActionButton('发布房源',(){
            Navigator.of(context).pushNamed('roomAdd');
          }),
          appBar: AppBar(
            title: Text('房间管理'),
            bottom: TabBar(
              tabs: [
                Tab(text: '已租'),
                Tab(
                  text: '空置',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: dataList.map((e) => RoomListItemWidget(e)).toList(),
              ),
              ListView(
                children: dataList.map((e) => RoomListItemWidget(e)).toList(),
              )
            ],
          ),
        ));
  }
}


