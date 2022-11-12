import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/dimensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            minimumSize: Size(deviceWidth, 50)),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w700)));
  }
}
