import 'package:flutter/material.dart';

import 'index_recommend_item_widget.dart';
import 'index_recommend_data.dart';

class IndexRecommend extends StatelessWidget {

  final List<IndexRecommendItem> dataList;

  const IndexRecommend({super.key,this.dataList = indexRecommendData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0x08000000)),
      child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('房屋推荐',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              Text('更多',style: TextStyle(color: Colors.black54),)
            ],
          ),
        Padding(padding: EdgeInsets.all(5)),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: dataList.map((e) => IndexRecommendItemWidget(e)).toList(),
        )
      ],),
    );
  }
}
