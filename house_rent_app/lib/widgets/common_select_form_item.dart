import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_form_item.dart';

import '../utils/common_picker/index.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final int value;
  final List<String> options;
  final Function(int) onChange;

  const CommonSelectFormItem(
      {super.key,
      required this.label,
      required this.value,
      required this.options,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contextBuilder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            var result = CommonPicker.showPicker(
                context: context, options: options, value: value);
            result.then((selectedValue) {
              if (value != selectedValue &&
                  selectedValue != null &&
                  onChange != null) {
                onChange(selectedValue);
              }
            });
          },
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(options[value], style: TextStyle(fontSize: 16.0)),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
