import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final void Function()? onPressed;
  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.obscureText = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: deviceHeight * 0.008, bottom: deviceHeight * 0.008),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) =>
            value!.isEmpty ? '$labelText is a required field' : null,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF0D1321).withOpacity(0.05),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onPressed,
                  )
                : null,
            border: InputBorder.none,
            labelText: 'Enter your ${labelText.toLowerCase()}'),
      ),
    );
  }
}
