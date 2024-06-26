import 'package:flutter/widgets.dart';
import 'package:notion_todo/constants/sizes.dart';
import 'package:notion_todo/constants/colors.dart';

class TodoText extends StatelessWidget {
  const TodoText(
    this.text, {
    this.size = FontSizes.body,
    this.color = FontColors.secondary,
    this.strong = false,
    this.italic = false,
    this.height = 1.2,
    this.align = TextAlign.left,
    this.maxLines,
    this.style,
  });

  final String? text;
  final double? size;
  final Color? color;
  final bool? strong;
  final bool? italic;
  final double? height;
  final TextAlign? align;
  final int? maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: align,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        height: height,
        fontSize: size,
        color: color,
        fontWeight: strong! ? FontWeight.bold : FontWeight.w500,
        fontStyle: italic! ? FontStyle.italic : null,
      ).merge(style),
    );
  }
}
