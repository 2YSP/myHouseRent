import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/common_image_picker.dart';
import '../../../widgets/common_radio_form_item.dart';
import '../../../widgets/common_select_form_item.dart';
import '../../../widgets/common_title.dart';
import '../../../widgets/room_appliance.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<StatefulWidget> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorateType = 0;

  // 户型
  int roomType = 0;

  // 楼层
  int floor = 0;

  // 朝向
  int chao_xiang = 0;

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布房源'),
      ),
      body: ListView(
        children: [
          const CommonTitle('房源信息'),
          CommonFormItem(
              label: '小区',
              contextBuilder: (context) {
                return Container(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      height: 40,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '请选择小区',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('search');
                    },
                  ),
                );
              }),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            },
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            options: ['一室', '二室', '三室', '四室'],
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            options: ['高楼层', '中楼层', '低楼层'],
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: chao_xiang,
            options: ['东', '南', '西', '北'],
            onChange: (val) {
              setState(() {
                chao_xiang = val;
              });
            },
          ),
          CommonRadioFormItem(
            label: '装修',
            options: ['精装', '简装'],
            value: decorateType,
            onChange: (index) {
              setState(() {
                decorateType = index;
              });
            },
          ),
          CommonTitle('房源图像'),
          CommonImagePicker(onChange: (List<File> list) {}),
          CommonTitle('房源标题'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入标题(例如 整租，小区名 2室 2000元)'
              ),
            ),
          ),
          CommonTitle('房源配置'),
          RoomAppliance(onChange: (data){},),
          CommonTitle('房源描述'),
          Container(
            margin: EdgeInsets.only(bottom: 100),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入房屋描述信息'
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
    );
  }
}
