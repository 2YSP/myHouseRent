import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

var imageWidth = 750;
var imageHeight = 424.0;
var ratio = imageWidth / imageHeight;

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

class CommonImagePicker extends StatefulWidget {

  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({super.key, required this.onChange});

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}



class _CommonImagePickerState extends State<CommonImagePicker> {

  List<File> files = [];

  final ImagePicker imagePicker = ImagePicker();

  _pickImage() async{
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image == null){
      return;
    }
   setState(() {
     files = files..add(File(image.path));
   });
    widget.onChange(files);
  }

  

  @override
  Widget build(BuildContext context) {
  var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
  var height = width / ratio;

  var addButton = GestureDetector(
    onTap: _pickImage,
    // 空白区域也可以点击
    behavior: HitTestBehavior.translucent,
    child: Container(
      width: width,
      height: height,
      color: Colors.grey,
      child: Center(child: Text("+",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w100))),
    ),
  );

  Widget wrapper(File image){
    return Stack(
      clipBehavior:Clip.none,
      children: [
        Image.file(image,width: width,height: height,),
        Positioned(
            right: -10,
            top: -20,
            child: IconButton(
              onPressed: (){
                setState(() {
                  files = files..remove(image);
                });
                if(widget.onChange != null){
                  widget.onChange(files);
                }
            },
            icon: Icon(Icons.delete,color: Colors.red)))
      ],
    );
  }
  
  List<Widget> imageList = files.map((item) => wrapper(item)).toList()
    ..add(addButton);

    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: imageList,
      ),
    );
  }
}
