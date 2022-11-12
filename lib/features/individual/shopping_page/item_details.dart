import 'package:flutter/material.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../../../common/widgets/text_subtitle.dart';
import 'widgets/half_button.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                const TextTitle(text: 'Item Detail', fontSize: 22),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(children: const [
                      Icon(Icons.shopping_cart, color: white, size: 18),
                    ]),
                  ),
                )
              ],
            ),
            SizedBox(height: deviceHeight * 0.01),
            Container(
              clipBehavior: Clip.antiAlias,
              height: deviceHeight * 0.3,
              width: deviceWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                arguments['image']!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: deviceHeight * 0.02),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: TextTitle(
                  text: 'Eco Friendly Bags',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const TextSubtitle(
                text: 'Product Description',
                fontSize: 14,
                fontWeight: FontWeight.w300),
            const Spacer(),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HalfButton(
                    text: 'Add to Cart',
                    onPressed: () {},
                    color: white,
                    textColor: Colors.black,
                  ),
                  HalfButton(text: 'Buy Now', onPressed: () {})
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
