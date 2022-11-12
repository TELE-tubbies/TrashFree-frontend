import 'package:flutter/material.dart';

import '../../../../common/widgets/text_subtitle.dart';
import '../../../../constants/color_constants.dart';

class RequestItemRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  const RequestItemRow(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: secondaryColor),
          child: Icon(iconData)),
      title: TextSubtitle(text: title, fontWeight: FontWeight.w600),
      subtitle: TextSubtitle(text: subtitle, fontWeight: FontWeight.w500),
    );
  }
}
