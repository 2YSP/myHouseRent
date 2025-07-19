import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommonPicker {
  static Future<int?> showPicker(
      {required BuildContext context,
      required List<String> options,
      required int value,
      double height = 300}) {
    return showCupertinoModalPopup<int>(
        context: context,
        builder: (BuildContext context) {

          var buttonTextStyle = TextStyle(
            // color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600
          );

          var controller = FixedExtentScrollController(initialItem: value);
          return Container(
            height: height,
            color: Colors.grey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  color: Colors.grey[200],
                  height: 40,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('取消',style: buttonTextStyle)),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop(controller.selectedItem);
                      }, child: Text('确定',style: buttonTextStyle))
                    ],
                  ),
                ),
                Expanded(child: CupertinoPicker(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 32,
                  onSelectedItemChanged: (val){},
                  children: options.map((e) => Text(e)).toList(),
                    scrollController: controller
                ))
              ],
            ),
          );
        });
  }
}
