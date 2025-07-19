import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator_item.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

class IndexNavigator extends StatelessWidget {

  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigatorItemList.map((item) => InkWell(
          onTap: (){
            item.onTap!(context);
          },
          child: Column(
            children: [
              CommonImage(item.imageUrl,width: 47.5),
              Text(item.title)
            ],
          ),
        )).toList(),
      ),
    );
  }
}


