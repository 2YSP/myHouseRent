import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/common_tag.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/room_appliance.dart';
import '../home/info/index.dart';

class RoomDetailPage extends StatefulWidget {

  final String roomId;

  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

var buttonStyle = TextStyle(color: Colors.white,fontSize: 20.0);

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData detailData;
  bool isLike = false;
  bool showAllText = false;

  @override
  void initState() {
    setState(() {
      detailData = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(detailData == null){
      return Container();
    }
    var showTextTool = detailData.subTitle.length > 100;
    return Scaffold(
      appBar: AppBar(title: Text(detailData.title),
        actions: [IconButton(onPressed: (){
          Share.share('https://www.cnblogs.com/');
        }, icon: Icon(Icons.share))],),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(images: detailData.houseImgs,),
              CommonTitle(detailData.title),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(detailData.price.toString(),style: TextStyle(fontSize: 20,color: Colors.pink),),
                    Text('元/月(押一付三)',style: TextStyle(fontSize: 14,color: Colors.pink),)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 6,bottom: 6),
                child: Wrap(
                  spacing: 4,
                  children: detailData.tags.map((item) => CommonTag(item)).toList(),
                ),
              ),
              Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 6,bottom: 6),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    BaseInfoItem(content: "面积：${detailData.size}平米"),
                    BaseInfoItem(content: "楼层：${detailData.floor}平米"),
                    BaseInfoItem(content: "房型：${detailData.roomType}平米"),
                    BaseInfoItem(content: "装修：精装"),
                  ],
                ),
              ),
              CommonTitle('房屋配置'),
              RoomApplianceList(configList : detailData.applicances),
              CommonTitle('房屋概况'),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detailData.subTitle ?? '暂无房间概况',
                      maxLines: showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       showTextTool ? GestureDetector(
                         onTap: (){
                            setState(() {
                              showAllText = !showAllText;
                            });
                         },
                         child: Row(
                           children: [
                             Text(showAllText ? '收起':'展开'),
                             Icon(showAllText ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
                           ],
                         ),
                       ) : Container(),
                        Text('举报')
                      ],
                    )
                  ],
                ),
              ),
              CommonTitle('猜你喜欢'),
              Info(),
              Container(
                height: 100,
              )
            ],
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 100,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 20),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isLike = !isLike;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              isLike ? Icons.star:Icons.star_border,
                              size: 24,
                              color: isLike ? Colors.green : Colors.black,),
                            Text(
                              isLike ? '已收藏' : '收藏',
                              style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(6)),
                        child: Center(child: Text('联系房东',style: buttonStyle,),),
                      ),
                    )),
                    Expanded(child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(6)),
                        child: Center(child: Text('预约看房',style: buttonStyle,),),
                      ),
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {

  final String content;

  const BaseInfoItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 3 * 10)/2,
      child: Text(content,style: TextStyle(fontSize: 16),),
    );
  }
}

