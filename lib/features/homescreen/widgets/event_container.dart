import 'package:flutter/material.dart';
import 'package:trashfree/common/widgets/text_title.dart';

import '../../../common/widgets/text_subtitle.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/dimensions.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            height: deviceHeight * 0.24,
            margin: EdgeInsets.only(
                top: deviceHeight * 0.02, right: deviceWidth * 0.04),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDFDFDF)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  width: deviceWidth * 0.92,
                  height: deviceHeight * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/event_image.jpeg'),
                        fit: BoxFit.cover),
                  )),
              Expanded(
                  child: Container(
                      width: deviceWidth * 0.92,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: primaryColor),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        margin: EdgeInsets.only(right: deviceWidth * 0.02),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const EventTitle(
                                        title: 'Clean Up Nepal',
                                        organizedBy: 'SHYC'),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 8),
                                            child: TextSubtitle(
                                                text: 'Join Now',
                                                color: primaryColor,
                                                fontSize: 12)))
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const EventText(
                                          iconData: Icons.location_on,
                                          valueText:
                                              'Pashipati Temple, Gaushala',
                                        ),
                                        SizedBox(height: deviceHeight * 0.01),
                                        const EventText(
                                          iconData: Icons.calendar_today,
                                          valueText: '20 Nov, 2022 at 10:30 AM',
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: CustomAvatar(),
                                        ),
                                        TextTitle(
                                          text: 'and 10 others',
                                          fontSize: 12,
                                          color: white,
                                        )
                                      ],
                                    ),
                                  ]),
                            ]),
                      )))
            ])));
  }
}

class EventTitle extends StatelessWidget {
  final String title;
  final String organizedBy;
  const EventTitle({Key? key, required this.title, required this.organizedBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextSubtitle(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: white,
        ),
        SizedBox(width: deviceWidth * 0.03),
        SizedBox(
          width: deviceWidth * 0.22,
          child: TextSubtitle(
            text: organizedBy,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: white,
          ),
        )
      ],
    );
  }
}

class EventText extends StatelessWidget {
  final IconData iconData;
  final String valueText;
  final double fontSize;
  const EventText(
      {Key? key,
      required this.iconData,
      required this.valueText,
      this.fontSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData, color: white, size: fontSize),
        SizedBox(width: deviceWidth * 0.02),
        SizedBox(
          width: deviceWidth * 0.51,
          child: TextSubtitle(
            text: valueText,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        )
      ],
    );
  }
}

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                child: Image.network(
                    'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Image-HD.png'),
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                child: Image.network(
                    'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Image-HD.png'),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                child: Image.network(
                    'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Image-HD.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
