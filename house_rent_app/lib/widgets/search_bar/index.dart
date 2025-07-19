import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import '../../models/general_type.dart';
import '../../scoped_model/city.dart';
import '../../utils/store.dart';
import 'package:collection/collection.dart';

class MySearchBar extends StatefulWidget {
  // 是否展示位置按钮
  final bool? showLocation;

  // 回退按钮函数
  final void Function()? goBackCallBack;

  // 搜索框输入值
  final String? inputValue;

  // 搜索框默认值
  final String defaultInputValue;

  // 取消按钮
  final void Function()? onCancel;

  // 是否展示地图按钮
  final bool? showMap;

  // 用户点击搜索框触发
  final void Function() onSearch;

  final ValueChanged<String>? onSearchSubmit;

  MySearchBar(
      {Key? key,
      this.showLocation,
      this.goBackCallBack,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      required this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  String _searchWord = '';

  late FocusNode _focus;

  late TextEditingController _controller;

  void _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    // _controller.addListener(() {
    //   setState(() {
    //     _searchWord = _controller.text;
    //     print(_searchWord);
    //   });
    // });
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  _changeLocation() async{
    var result = await CityPickers.showCitiesSelector(
        context: context,
      theme: ThemeData(primaryColor: Colors.green)
    );
    String? cityName = result?.cityName;
    if(cityName == null) return;

    GeneralType? city = Config.availableCityList.firstWhereOrNull((city) => cityName.startsWith(city.name));
    if(city == null){
      CommonToast.showToast('该城市暂未开通！');
      return;
    }
    _saveCity(city);
  }

  _saveCity(GeneralType? city) async {
    if(city == null) return;
    ScopedModelHelper.getModel<CityModel>(context).city = city;
    var store = await Store.getInstance();
    String cityString = json.encode(city.toJson());
    store.setString(StoreKeys.CITY, cityString);
  }

  @override
  Widget build(BuildContext context) {
    GeneralType? city = ScopedModelHelper.getModel<CityModel>(context).city;
    if(city == null){
      city = Config.availableCityList.first;
      _setCityModel();
    }

    return Container(
      child: Row(children: <Widget>[
        if (widget.showLocation != null)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                _changeLocation();
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16,
                  ),
                  Text(
                    city?.name??'',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        if (widget.goBackCallBack != null)
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.goBackCallBack,
              child: Icon(
                Icons.chevron_left,
                color: Colors.black87,
              ),
            ),
          ),
        Expanded(
            child: Container(
                height: 34,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    // 圆角
                    borderRadius: BorderRadius.circular(17.0)),
                margin: EdgeInsets.only(right: 10.0),
                child: TextField(
                  focusNode: _focus,
                  onTap: (){
                    if(widget.onSearchSubmit == null){
                      _focus.unfocus();
                    }
                    widget.onSearch();
                  },
                  onSubmitted: widget.onSearchSubmit,
                  textInputAction: TextInputAction.search,
                  controller: _controller,
                  onChanged: (String value){
                    setState(() {
                      _searchWord = value;
                      print(_searchWord);
                    });
                  },
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 2.0, left: -10.0),
                    hintText: '请输入搜索词',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    icon: Padding(
                      padding: EdgeInsets.only(top: 4.0, left: 8),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                        onTap: _onClean,
                        child:
                            Icon(Icons.clear, color: _searchWord.isEmpty ? Colors.grey[200] : Colors.grey, size: 18.0)),
                  ),
                ))),
        if (widget.onCancel != null )
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.onCancel,
              child: Text(
                "取消",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
        if (widget.showMap != null )
          CommonImage("static/icons/widget_search_bar_map.png")
      ]),
    );
  }

  void _setCityModel() async {
    var store = await Store.getInstance();
    var cityString = await store.getString(StoreKeys.CITY);
    if(cityString == null) return;
    var city = GeneralType.fromJson(json.decode(cityString));
    ScopedModelHelper.getModel<CityModel>(context).city = city;
  }
}
