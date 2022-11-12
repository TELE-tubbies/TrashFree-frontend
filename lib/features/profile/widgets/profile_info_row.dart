import 'package:flutter/material.dart';

import '../../../common/widgets/text_subtitle.dart';
import '../../../constants/color_constants.dart';

class ProfileInfoRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData iconData;
  const ProfileInfoRow(
      {Key? key, required this.title, this.subtitle, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: secondaryColor),
          child: Icon(iconData, size: 22)),
      title:
          TextSubtitle(text: title, fontWeight: FontWeight.w600, fontSize: 16),
      subtitle: subtitle != null
          ? TextSubtitle(
              text: subtitle!,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black54,
            )
          : null,
    );
  }
}
