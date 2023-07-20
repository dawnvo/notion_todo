import 'package:flutter/material.dart';
import 'package:notion_todo/constants/colors.dart';
import 'package:notion_todo/components/icon.dart';
import 'package:notion_todo/components/text.dart';

class ActionListItem extends StatelessWidget {
  const ActionListItem({
    required this.done,
    required this.title,
    this.onPressed,
    this.onLongPressed,
  });

  final bool done;
  final String title;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    final icon = done //
        ? FlutterRemix.checkbox_fill
        : FlutterRemix.checkbox_blank_line;
    final color = done //
        ? FontColors.hint
        : FontColors.primary;

    return ListTile(
      dense: true,
      minLeadingWidth: 0,
      horizontalTitleGap: 8,
      contentPadding: const EdgeInsets.only(left: 12),
      leading: TodoIcon(
        icon,
        color: FontColors.hint,
      ),
      title: TodoText(
        title,
        color: color,
      ),
      onTap: onPressed,
      onLongPress: onLongPressed,
    );
  }
}
