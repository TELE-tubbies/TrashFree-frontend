import 'package:flutter/material.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../../../../constants/color_constants.dart';

class HalfButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color textColor;
  const HalfButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.color,
      this.textColor = white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFFDFDFDF), width: 0.5),
                borderRadius: BorderRadius.circular(5.0)),
            minimumSize: Size(deviceWidth / 2.25, 48)),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.w500)));
  }
}
