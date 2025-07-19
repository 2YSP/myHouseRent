import 'package:flutter/material.dart';

class FilterBarItem extends StatelessWidget {

  // 标题
  final String title;
  // 是否选中
  final bool active;
  // 点击函数
  final Function(BuildContext) onTapFunc;

  const FilterBarItem(this.title,this.active,this.onTapFunc,{super.key});

  @override
  Widget build(BuildContext context) {
    var color = active ? Colors.green : Colors.black87;
    return GestureDetector(
      onTap: (){
        if(onTapFunc != null){
          onTapFunc(context);
        }
      },
      child: Container(
        child: Row(
          children: [
            Text(title,style: TextStyle(fontSize: 16,color: color),),
            Icon(Icons.arrow_drop_down,color:color,size: 20 ,)
          ],
        ),
      ),
    );
  }
}
