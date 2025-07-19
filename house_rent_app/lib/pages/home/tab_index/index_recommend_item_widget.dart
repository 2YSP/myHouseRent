import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';
import 'index_recommend_data.dart';

var textStyle = const TextStyle(fontSize: 14,fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget(
      this.data, {
        Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(data.navigateUri);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 10*3)/2,
        height: 100,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.title,style: textStyle,),
                Text(data.subTitle,style: textStyle,)
              ],
            ),
            CommonImage(data.imageUri,width: 55,)
          ],
        ),
      ),
    );
  }
}

