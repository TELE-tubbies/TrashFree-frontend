import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  const TextTitle({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.w600, color: color),
    );
  }
}
