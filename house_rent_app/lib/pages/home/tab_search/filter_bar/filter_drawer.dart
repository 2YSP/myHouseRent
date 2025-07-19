import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

import '../../../../models/general_type.dart';
import '../../../../scoped_model/room_filter.dart';
import '../../../../utils/scoped_model_helper.dart';

class FilterDrawer extends StatelessWidget {

  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String,List<GeneralType>> dataMap = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    var roomTypeList = dataMap['roomTypeList']!;
    var orientedList = dataMap['orientedList']!;
    var floorList = dataMap['floorList']!;

    _onChange(String id){
      ScopedModelHelper.getModel<FilterBarModel>(context).selectedListUpdate(id);
    }

    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context).selectedList.toList();

    return Drawer(
      child: SafeArea(child: ListView(
        children: [
          CommonTitle('户型'),
          FilterDrawerItem(list: roomTypeList,selectedIds: selectedIds,onChange: _onChange,),
          CommonTitle('朝向'),
          FilterDrawerItem(list: orientedList,selectedIds: selectedIds,onChange:_onChange,),
          CommonTitle('楼层'),
          FilterDrawerItem(list: floorList,selectedIds: selectedIds,onChange: _onChange,),
        ],
      )),
    );
  }
}


class FilterDrawerItem extends StatelessWidget {

  final List<GeneralType> list;

  final List<String> selectedIds;

  final ValueChanged<String> onChange;

  const FilterDrawerItem({super.key, required this.list,required this.selectedIds,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Wrap(
        runSpacing: 10,
        spacing: 20,
        children: list.map((item){
          bool active = selectedIds.contains(item.id);
          return GestureDetector(
              onTap: (){
                if(onChange != null){
                  onChange(item.id);
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.green),color: active ? Colors.green : Colors.white),
                child: Center(child: Text(item.name,style: TextStyle(color: active ? Colors.white : Colors.green),),),
              )
          );
        }).toList(),
      ),
    );
  }
}

