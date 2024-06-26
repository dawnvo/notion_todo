import 'package:flutter/material.dart';
import 'package:notion_todo/constants/colors.dart';
import 'package:notion_todo/constants/sizes.dart';
import 'package:notion_todo/components/text.dart';

class ModalSheet extends StatelessWidget {
  const ModalSheet({
    required this.title,
    required this.child,
    this.submit,
  });

  final String title;
  final Widget child;
  final Widget? submit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      color: CommonColors.background,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _header,
        child,
        const SizedBox(height: 64),
        if (submit != null) submit!,
      ]),
    );
  }

  Widget get _header {
    return SizedBox(
      height: 96,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          TodoText(
            title,
            size: FontSizes.headline,
            color: FontColors.primary,
            strong: true,
          ),
        ],
      ),
    );
  }
}
