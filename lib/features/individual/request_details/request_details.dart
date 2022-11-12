import 'package:flutter/material.dart';
import 'package:trashfree/common/widgets/custom_button.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../../../constants/color_constants.dart';
import 'widgets/request_item_row.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(children: [
            SizedBox(width: deviceWidth * 0.09),
            Image.asset('assets/images/live_tracking.png'),
            SizedBox(width: deviceWidth * 0.02),
            const TextSubtitle(
                text: 'Live Tracker',
                color: Colors.red,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ]),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.location_on),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(children: [
          Positioned(
            top: 0,
            child: Container(
                alignment: Alignment.bottomRight,
                width: deviceWidth,
                height: deviceHeight * 0.4,
                margin: EdgeInsets.only(top: deviceHeight * 0.066),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/route.png',
                        ))),
                child: Padding(
                  padding: EdgeInsets.all(deviceWidth * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircularButton(iconData: Icons.add),
                      SizedBox(width: deviceWidth * 0.02),
                      const CircularButton(iconData: Icons.remove),
                    ],
                  ),
                )),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: deviceWidth,
              height: deviceHeight * 0.55,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 20.0,
                        spreadRadius: 2.0)
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
              child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TextTitle(text: 'Request Info', fontSize: 18),
                        TextSubtitle(
                            text: 'Nov 11, 2022', fontWeight: FontWeight.w500)
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    const RequestItemRow(
                        title: 'Request ID',
                        subtitle: '9279049',
                        iconData: Icons.numbers),
                    const RequestItemRow(
                        title: 'Vehical No.',
                        subtitle: 'Truck Ba 59 Pa 2346',
                        iconData: Icons.car_repair),
                    const RequestItemRow(
                        title: 'Pickup Location',
                        subtitle: 'Jamal, Kathmandu',
                        iconData: Icons.location_on),
                    SizedBox(height: deviceHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TextTitle(text: 'Total Price', fontSize: 20),
                        TextSubtitle(text: 'Rs 120', color: primaryColor)
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.03),
                    Row(
                      children: [
                        const TextSubtitle(
                            text: 'Payment Status: ', fontSize: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: const TextSubtitle(
                              text: 'Pending', fontSize: 12, color: white),
                        )
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      text: 'Cancel Request',
                      onPressed: () {},
                      color: Colors.red,
                    ),
                    SizedBox(height: deviceHeight * 0.04),
                  ])),
            ),
          )
        ]));
  }
}

class CircularButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onTap;
  const CircularButton({Key? key, required this.iconData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 10.0, spreadRadius: 2.0)
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Icon(iconData, size: 23),
      ),
    );
  }
}
