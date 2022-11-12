import 'package:flutter/material.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/constants/dimensions.dart';

import 'widgets/item_container.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextTitle(text: 'Shop', fontSize: 22),
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
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: deviceWidth,
                    height: deviceHeight * 0.3,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) => const ItemContainer()),
                  )),
              SizedBox(height: deviceHeight * 0.05),
              const TextSubtitle(text: 'Featured', fontSize: 18),
              const ItemContainer(
                  widthFactor: 1, heightFactor: 0.28, marginRight: 0)
            ],
          ),
        ),
      ),
    );
  }
}
