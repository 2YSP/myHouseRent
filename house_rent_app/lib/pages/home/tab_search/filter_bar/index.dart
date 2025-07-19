
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/common_picker/index.dart';
import 'package:hook_up_rent/utils/dio_http.dart';

import '../../../../models/general_type.dart';
import '../../../../utils/common_toast.dart';
import '../../../../utils/scoped_model_helper.dart';
import 'data.dart';
import 'filter_bar_item.dart';

String? lastCityId;

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  FilterBar({super.key, required this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool areaActive = false;
  bool rentTypeActive = false;
  bool priceActive = false;
  bool filterActive = false;

  // 4个结果值
  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  List<GeneralType> areaList = [
  ];
  List<GeneralType> priceList = [
  ];
  List<GeneralType> rentTypeList = [
  ];
  List<GeneralType> roomTypeList = [
  ];
  List<GeneralType> orientedList = [
  ];
  List<GeneralType> floorList = [
  ];

  _onAreaChange(context) {
    setState(() {
      areaActive = true;
    });
    var result =
        CommonPicker.showPicker(
            context: context,
            options: areaList.map((e) => e.name).toList(),
            value: 0);
    result.then((index){
      if(index != null){
        setState(() {
          areaId = areaList[index].id;
        });
      _onChange(context);
      }
    })
    .whenComplete(()
    {
        setState(() {
          areaActive = false;
        });
    });
  }


  _onRentTypeChange(context) {
    setState(() {
      rentTypeActive = true;
    });
    var result =
    CommonPicker.showPicker(
        context: context,
        options: rentTypeList.map((e) => e.name).toList(),
        value: 0);
    result.then((index){
      if(index != null){
        setState(() {
          rentTypeId = rentTypeList[index].id;
        });
        _onChange(context);
      }
    })
        .whenComplete(()
    {
      setState(() {
        rentTypeActive = false;
      });
    });
  }

  _onPriceChange(context) {
    setState(() {
      priceActive = true;
    });
    var result =
    CommonPicker.showPicker(
        context: context,
        options: priceList.map((e) => e.name).toList(),
        value: 0);
    result.then((index){
      if(index != null){
        setState(() {
          priceId = priceList[index].id;
        });
        _onChange(context);
      }
    })
        .whenComplete(()
    {
      setState(() {
        priceActive = false;
      });
    });
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChange(context) {
    // 每次组件变更都获取选择的id
    Set<String> ids = ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(areaId, priceId, rentTypeId, ids.toList()));
    }
  }

  _getData() async {
    // 初始化时往model里填充选择数据
    var cityId = ScopedModelHelper.getAreaId(context);
    print('cityId=$cityId');
    lastCityId = cityId;
    String url = "/house/conditions?id=$cityId";
    var resp = await DioHttp.of(context).get(url);
    if(!mounted){
      // 如果组件已经卸载，则不再调用setState
      return;
    }

    var respMap = json.decode(resp.toString());
    if (respMap['code'] != 200) {
      CommonToast.showToast(respMap['msg']);
      return;
    }
    var data = respMap['data'];

    List<GeneralType> areaList =
    List<GeneralType>.from(data['area'].map((item) => GeneralType.fromJson(item)).toList());

    List<GeneralType> priceList =
    List<GeneralType>.from(data['price'].map((item) => GeneralType.fromJson(item)).toList());

    List<GeneralType> rentTypeList =
    List<GeneralType>.from(data['rentType'].map((item) => GeneralType.fromJson(item)).toList());

    List<GeneralType> roomTypeList =
    List<GeneralType>.from(data['roomType'].map((item) => GeneralType.fromJson(item)).toList());
    List<GeneralType> orientedList =
    List<GeneralType>.from(data['oriented'].map((item) => GeneralType.fromJson(item)).toList());
    List<GeneralType> floorList =
    List<GeneralType>.from(data['floor'].map((item) => GeneralType.fromJson(item)).toList());

    setState(() {
      this.areaList = areaList;
      this.priceList = priceList;
      this.rentTypeList = rentTypeList;
      this.roomTypeList = roomTypeList;
      this.orientedList = orientedList;
      this.floorList = floorList;
    });
    var dataMap = Map<String,List<GeneralType>>();
    dataMap['roomTypeList'] = roomTypeList;
    dataMap['orientedList'] = orientedList;
    dataMap['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataMap;
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange(context);
    var cityId = ScopedModelHelper.getAreaId(context);
    if(lastCityId != null && lastCityId != cityId){
      _getData();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterBarItem('区域', areaActive, _onAreaChange),
          FilterBarItem('方式', rentTypeActive, _onRentTypeChange),
          FilterBarItem('租金', priceActive, _onPriceChange),
          FilterBarItem('筛选', filterActive, _onFilterChange),
        ],
      ),
    );
  }
}
