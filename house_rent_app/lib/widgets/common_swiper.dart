import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

const List<String> defaultImages = [
  'https://img2024.cnblogs.com/blog/1167086/202402/1167086-20240225131453418-971712332.png',
  'https://img2024.cnblogs.com/blog/1167086/202402/1167086-20240225131453418-971712332.png',
  'https://img2024.cnblogs.com/blog/1167086/202402/1167086-20240225131453418-971712332.png',
];
// 图片宽 750px 高 424px
var imageWidth = 2386.0;
var imageHeight = 1182.0;

class CommonSwiper extends StatelessWidget {
  List<String> images;

  CommonSwiper({Key? key, this.images = defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 计算图片高度
    var height = MediaQuery.of(context).size.width/imageWidth * imageHeight;
    return Container(
      height: height,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return CommonImage(images[index],fit: BoxFit.fill);
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        // control: SwiperControl()
      ),
    );
  }
}
