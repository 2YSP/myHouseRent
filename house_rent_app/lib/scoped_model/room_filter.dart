import 'package:scoped_model/scoped_model.dart';

import '../models/general_type.dart';


class FilterBarModel extends Model{

  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];

  Set<String> _selectedList = Set<String>();

  Map<String,List<GeneralType>> get dataList{
    var result = Map<String,List<GeneralType>>();
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;
    return result;
  }

  set dataList(Map<String,List<GeneralType>> data){
    _roomTypeList = data['roomTypeList']!;
    _orientedList = data['orientedList']!;
    _floorList = data['floorList']!;
    notifyListeners();
  }

  Set<String> get selectedList{
    return _selectedList;
  }

  selectedListUpdate(String dataId){
    if(_selectedList.contains(dataId)){
      _selectedList.remove(dataId);
    }else {
      _selectedList.add(dataId);
    }
    notifyListeners();
  }

}