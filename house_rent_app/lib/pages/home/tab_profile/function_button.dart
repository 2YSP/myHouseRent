import 'package:flutter/material.dart';

import 'function_button_data.dart';
import 'function_button_widget.dart';

class FunctionButton extends StatelessWidget {

  const FunctionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 1,
        runSpacing: 1,
        children: list.map((item) => FunctionButtonWidget(item)).toList(),
      ),
    );
  }
}
