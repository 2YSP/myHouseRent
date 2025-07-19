import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_check_button.dart';
import '../config.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);

}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];


class RoomAppliance extends StatefulWidget {

  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({super.key, required this.onChange});

  @override
  State<RoomAppliance> createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {

  List<RoomApplianceItem> list = _dataList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30,
      children: list.map((item) => GestureDetector(
        onTap: (){
          setState(() {
            list = list.map((e) => item == e ? new RoomApplianceItem(e.title, e.iconPoint, !e.isChecked) : e ).toList();
          });
          if(widget != null){
            widget.onChange(list);
          }
        },
          behavior: HitTestBehavior.translucent,
        child: Container(
          // 5分之一宽
            width: MediaQuery.of(context).size.width/5,
            child: Column(
              children: [
                Icon(IconData(item.iconPoint,fontFamily: Config.CommonIcon),size: 40,),
                Padding(padding: EdgeInsets.all(10),child:  Text(item.title),),
                CommonCheckButton(isChecked: item.isChecked)
              ],
            ),
      )
      )).toList(),
    );
  }
}

class RoomApplianceList extends StatelessWidget {
  final List<String> configList;

  const RoomApplianceList({super.key, required this.configList});

  @override
  Widget build(BuildContext context) {
    var showList = _dataList.where((element) => configList.contains(element.title)).toList();
    if(showList.length == 0){
      return Container(
        padding: EdgeInsets.only(left: 10),
        child: Text('暂无房间配置信息'),
      );
    }
    return Wrap(
      runSpacing: 30,
      children: showList.map((item) =>
           Container(
            // 5分之一宽
            width: MediaQuery.of(context).size.width/5,
            child: Column(
              children: [
                Icon(IconData(item.iconPoint,fontFamily: Config.CommonIcon),size: 40,),
                Padding(padding: EdgeInsets.all(10),child:  Text(item.title),),
              ],
            ),
          )
      ).toList(),
    );
  }
}

