import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trashfree/common/widgets/custom_button.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/request_page/request_page_controller.dart';

import 'widgets/build_button.dart';
import 'widgets/secondary_custom_button.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  static List<Map<String, dynamic>> buttons = [
    {"label": "Recyclable", "icon_path": 'assets/images/recyclable.png'},
    {"label": "Bio-degradable", "icon_path": 'assets/images/bio.png'},
    {"label": "Non bio-degradable", "icon_path": 'assets/images/non-bio.png'},
    {"label": "Industrial", "icon_path": 'assets/images/industrial.png'}
  ];

  @override
  Widget build(BuildContext context) {
    final RequestPageController controller = Get.put(RequestPageController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const TextSubtitle(text: 'Make a request', fontSize: 22),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextTitle(text: 'Request Info', fontSize: 18),
              SizedBox(height: deviceHeight * 0.02),
              Row(children: [
                Obx(() => RowInfo(
                      title: 'Date: ',
                      value: DateFormat('MMM dd, yyyy')
                          .format(controller.selectedDate.value!),
                      onTap: () => controller.selectDate(context),
                    )),
                SizedBox(width: deviceWidth * .06),
                Obx(
                  () => RowInfo(
                    title: 'Pickup time: ',
                    value: controller.selectedTime.value!.format(context),
                    onTap: () => controller.selectTime(context),
                  ),
                ),
              ]),
              SizedBox(height: deviceHeight * 0.03),
              const TextTitle(text: 'Waste Type', fontSize: 18),
              SizedBox(height: deviceHeight * 0.02),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 11,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.04,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.01),
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() => buildButton(buttons[index]['label'],
                        buttons[index]['icon_path'], index));
                  }),
              SizedBox(height: deviceHeight * 0.01),
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: controller.isCheckboxSelected.value,
                      onChanged: (value) => controller.setCheckbox(value!))),
                  const TextTitle(
                      text: 'I don\'t know',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ],
              ),
              SizedBox(height: deviceHeight * 0.01),
              SecondaryCustomButton(
                text: 'Set a pickup location',
                onPressed: () {},
              ),
              Container(
                width: deviceWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: deviceWidth * 0.05,
                    vertical: deviceHeight * 0.02),
                child: const TextTitle(
                  text: 'Approx Price: Rs 30',
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              CustomButton(text: 'Request', onPressed: () {}),
              SizedBox(height: deviceHeight * 0.02),
              const TextTitle(
                text:
                    'Disclaimer: Above mentioned price is just an estimate. The final price will be decided by the vendor.',
                fontSize: 12,
                color: Colors.grey,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowInfo extends StatelessWidget {
  final String title;
  final String value;
  final void Function()? onTap;
  const RowInfo(
      {Key? key, required this.title, required this.value, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextSubtitle(text: title, fontSize: 14),
        SizedBox(width: deviceWidth * 0.01),
        GestureDetector(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5)),
              child: TextSubtitle(
                  text: value, fontSize: 14, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
