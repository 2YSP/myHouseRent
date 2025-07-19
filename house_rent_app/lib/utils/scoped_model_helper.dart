import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/scoped_model/city.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper{

  /// 获取Model
  static T getModel<T extends Model>(BuildContext context){
    return ScopedModel.of<T>(context,rebuildOnChange: true);
  }

  static String getAreaId(BuildContext context){
    return getModel<CityModel>(context).city?.id??"";
  }
}