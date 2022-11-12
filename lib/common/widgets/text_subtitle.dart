import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TextSubtitle(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w600,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      textAlign: textAlign,
    );
  }
}
