import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/text_subtitle.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/dimensions.dart';

class RequestContainer extends StatelessWidget {
  final String id;
  const RequestContainer({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/request_details', arguments: id),
      child: Container(
        height: deviceHeight * 0.24,
        margin: EdgeInsets.only(top: deviceHeight * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffDFDFDF)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: deviceHeight * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover),
                )),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: secondaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RequestText(
                              keyText: 'Request ID: ',
                              valueText: id,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: TextSubtitle(
                                    text: 'Price: Rs 120',
                                    color: white,
                                    fontSize: 12,
                                  )),
                            )
                          ]),
                      const RequestText(
                        keyText: 'Vehicle No: ',
                        valueText: 'Truck Ba 2 Kha',
                      ),
                      const RequestText(
                        keyText: 'Pickup Location: ',
                        valueText: 'Minbhawan Marg',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RequestText extends StatelessWidget {
  final String keyText;
  final String valueText;
  const RequestText({Key? key, required this.keyText, required this.valueText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextSubtitle(
          text: keyText,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        TextSubtitle(text: valueText, fontSize: 12)
      ],
    );
  }
}
