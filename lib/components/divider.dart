import 'package:flutter/material.dart';
import 'package:notion_todo/constants/colors.dart';
import 'package:notion_todo/constants/sizes.dart';
import 'package:notion_todo/components/text.dart';

class TodoDivider extends StatelessWidget {
  const TodoDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: TodoText(label, size: FontSizes.body, strong: true),
        ),
        const Expanded(
          child: Divider(
            height: 40,
            thickness: 1.0,
            color: CommonColors.divider,
          ),
        ),
      ],
    );
  }
}
