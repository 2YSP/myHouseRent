import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(this.title, this.color, this.backgroundColor,
      {Key? key})
      : super(key: key);

  factory CommonTag(String title) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(title, Colors.red, Colors.red[50]!);
      case '新上':
        return CommonTag.origin(title, Colors.red, Colors.red[50]!);
      case '集中供暖':
        return CommonTag.origin(title, Colors.blue, Colors.blue[50]!);
      case '随时看房':
        return CommonTag.origin(title, Colors.green, Colors.green[50]!);
      default:
        return CommonTag.origin(title,Colors.black,Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 10.0),
      ),
    );
  }
}
