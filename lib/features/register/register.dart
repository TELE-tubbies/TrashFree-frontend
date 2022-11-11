import 'package:flutter/material.dart';
import 'package:trashfree/resources/constants.dart';
import 'package:trashfree/resources/dimensions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: deviceHeight,
          child: Column(children: [
            Container(
              height: deviceHeight * 0.2,
              margin: EdgeInsets.only(
                  top: deviceHeight * 0.1, bottom: deviceHeight * 0.04),
              child: Image.asset('assets/images/register.png'),
            ),
            SizedBox(
                width: deviceWidth,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(height: deviceHeight * 0.02),
            const CustomTextField(
              prefixIcon: Icons.edit_outlined,
              labelText: 'Enter your username',
            ),
            const CustomTextField(
              prefixIcon: Icons.email_outlined,
              labelText: 'Enter your email',
            ),
            const CustomTextField(
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.remove_red_eye_outlined,
                labelText: 'Enter your password'),
            SizedBox(height: deviceHeight * 0.02),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    minimumSize: Size(deviceWidth, 50)),
                onPressed: () {},
                child: const Text('Sign Up',
                    style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700))),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                TextButton(child: const Text('Log In'), onPressed: () {}),
                SizedBox(
                  height: deviceHeight * 0.1,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: deviceHeight * 0.008, bottom: deviceHeight * 0.008),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF0D1321).withOpacity(0.05),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            border: InputBorder.none,
            labelText: labelText),
      ),
    );
  }
}
