import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'widgets/profile_info_row.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextTitle(text: 'Profile', fontSize: 22),
                  GestureDetector(
                    onTap: () => Get.offAndToNamed('/register_page'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(children: const [
                        Icon(Icons.logout, color: white, size: 14),
                        TextSubtitle(
                            text: ' Logout',
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)
                      ]),
                    ),
                  )
                ],
              ),
              SizedBox(height: deviceHeight * 0.03),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/33-332894_user-profile-avatar-man-boy-round-number-2.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextTitle(text: 'John Doe', fontSize: 20),
              ),
              const TextSubtitle(
                  text: 'roshish152002@gmail.com',
                  fontSize: 14,
                  color: Colors.grey),
              TextButton(
                  onPressed: () {},
                  child: const TextSubtitle(
                    text: 'Edit profile',
                    fontSize: 14,
                  )),
              SizedBox(height: deviceHeight * 0.01),
              const _Title(text: 'User Details'),
              const ProfileInfoRow(
                  iconData: Icons.phone,
                  title: 'Contact No.',
                  subtitle: '9832699339'),
              const ProfileInfoRow(
                  iconData: Icons.location_on,
                  title: 'Address',
                  subtitle: 'Maharjgunj, Kathmandu'),
              const _Title(text: 'Others'),
              const ProfileInfoRow(
                  iconData: Icons.contact_mail_outlined, title: 'Contact Us'),
              const ProfileInfoRow(
                  iconData: Icons.privacy_tip_outlined,
                  title: 'Terms and Conditions'),
              const ProfileInfoRow(
                  iconData: Icons.error_outline, title: 'Report an Issue')
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  const _Title({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
          child: TextTitle(text: text, fontSize: 20),
        ),
      ],
    );
  }
}
