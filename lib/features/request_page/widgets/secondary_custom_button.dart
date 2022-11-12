import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/dimensions.dart';

class SecondaryCustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const SecondaryCustomButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            minimumSize: Size(deviceWidth, 50)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_searching),
            SizedBox(width: deviceWidth * 0.02),
            Text(text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ],
        ));
  }
}
