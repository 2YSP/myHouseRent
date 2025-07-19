import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;

  const CommonTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(title,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),),
    );
  }
}
