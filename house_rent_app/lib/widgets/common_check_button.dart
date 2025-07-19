import 'package:flutter/material.dart';

class CommonCheckButton extends StatelessWidget {

  final bool isChecked;

  const CommonCheckButton({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return isChecked ? Icon(Icons.check_circle,color: Colors.green)
     : Icon(Icons.radio_button_unchecked,color: Colors.green,);
  }
}


