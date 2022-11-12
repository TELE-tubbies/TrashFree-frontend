import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../constants/dimensions.dart';

class ItemContainer extends StatelessWidget {
  final double heightFactor;
  final double widthFactor;
  final double marginRight;
  const ItemContainer({
    Key? key,
    this.heightFactor = 0.24,
    this.widthFactor = 0.55,
    this.marginRight = 0.04,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.toNamed('/item_details', arguments: {
              'image': 'assets/images/shopping_item.jpeg',
            }),
        child: Container(
            height: deviceHeight * heightFactor,
            width: deviceWidth * widthFactor,
            margin: EdgeInsets.only(
                top: deviceHeight * 0.02, right: deviceWidth * marginRight),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDFDFDF)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  width: deviceWidth * 0.92,
                  height: deviceHeight * 0.2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/shopping_item.jpeg'),
                        fit: BoxFit.cover),
                  )),
              Expanded(
                  child: Container(
                      width: deviceWidth * 0.92,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: white),
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
                                children: const [
                                  TextSubtitle(
                                    text: 'Eco Friendly Bags',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextSubtitle(
                                    text: 'Rs. 100',
                                    fontSize: 14,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                              const TextSubtitle(
                                text: 'Product Description',
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ]),
                      )))
            ])));
  }
}
