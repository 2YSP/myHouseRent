import 'package:flutter/material.dart';
class CommonFloatingActionButton extends StatelessWidget {
  final String title;
  final Function onTapHandle;

  const CommonFloatingActionButton(this.title,
      this.onTapHandle, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTapHandle != null) {
          onTapHandle();
        }
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}