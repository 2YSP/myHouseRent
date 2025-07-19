import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String label;

  final Widget Function(BuildContext context)? contextBuilder;

  final Widget? suffix;

  final String? suffixText;

  final String? hintText;
  final ValueChanged? valueChanged;
  final TextEditingController? controller;

  const CommonFormItem(
      {super.key,
      required this.label,
      this.contextBuilder,
      this.suffix,
      this.suffixText,
      this.hintText,
      this.valueChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14),
      decoration: BoxDecoration(border: Border(
        bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor)
      )),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(label,style: TextStyle(fontSize: 16,color: Colors.black87),),
          ),
          Expanded(
            child: contextBuilder != null ? contextBuilder!(context) : TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none
              ),
            ),
          ),
          if(suffix != null) suffix!,
          if(suffix == null && suffixText != null) Text(suffixText!),
        ],
      ),
    );
  }
}
