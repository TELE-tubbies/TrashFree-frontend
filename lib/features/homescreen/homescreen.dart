import 'package:flutter/material.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/homescreen/widgets/request_container.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceHeight * 0.02),
              const TextTitle(text: 'Our Services'),
              SizedBox(height: deviceHeight * 0.3),
              const TextTitle(text: 'Track Your Request'),
              const RequestContainer(id: '1289340'),
              const RequestContainer(id: '1201020'),
            ],
          ),
        )),
      ),
    );
  }
}