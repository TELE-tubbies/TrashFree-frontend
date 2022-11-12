import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/individual/homescreen/widgets/event_container.dart';
import 'package:trashfree/features/individual/homescreen/widgets/request_container.dart';

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
              Row(
                children: [
                  const TextTitle(text: 'Events'),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.toNamed('/profile'),
                    child: const CircleAvatar(
                      radius: 20,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/33-332894_user-profile-avatar-man-boy-round-number-2.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: deviceWidth,
                    height: deviceHeight * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) =>
                            const EventContainer()),
                  )),
              SizedBox(height: deviceHeight * 0.05),
              const TextTitle(text: 'Track Your Request'),
              const RequestContainer(id: '1289340'),
            ],
          ),
        )),
      ),
    );
  }
}
